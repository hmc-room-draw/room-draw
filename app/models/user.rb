class User < ApplicationRecord
  require 'csv'

  has_one :student, dependent: :destroy

  # Name and email must be non-nil
  validates :first_name, presence: true
  validates :last_name, presence: true

  accepts_nested_attributes_for :student, :allow_destroy => true

  # Email must be a valid email address
  # This regex is not technically email-compliant but is right in 99% of cases
  # From https://www.railstutorial.org/book/modeling_users
  validates :email, presence: true, uniqueness: true,
    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    
  before_save { self.email = email.downcase  }

  def self.from_omniauth(auth)
    where(email: auth.info.email).take do |user|
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.get_room(dorm, room_num)
    dorm_id = Dorm.find_by name: dorm
    room = Room.find_by dorm: dorm_id, number: room_num
    if room.nil?
      return nil
    end
    return room.attributes['id']
  end

  # Import users from a csv file
  # Checks to see if the user exists in the database (compares email). If the user exists,
  # it will attempt to update the user. If not, it will create a new user.
  def self.import(file)

    if not file.nil?
      CSV.foreach(file.path, headers: true) do |row|
        full_hash = row.to_hash
        
        student_hash = {"class_rank" => full_hash["class_rank"],
          "room_draw_number" => full_hash["room_draw_number"]}

        user_hash = {"first_name" => full_hash["first_name"],
          "last_name" => full_hash["last_name"],
          "email" => full_hash["email"],
          "student_attributes" => student_hash}

        room_hash = {"dorm" => full_hash["dorm"],
          "room" => full_hash["room"],
          "preplaced" => full_hash["preplaced"]}

        user = User.where(email: user_hash["email"])

        if user.count == 1
          # If the user has an associated student, keep those values of has_participated
          # and has_completed_form, otherwise set them to false (and create a student)
          student = user.first.student
          if student.nil?
            student_hash["has_participated"] = false
            student_hash["has_completed_form"] = true
          else
            student_hash["has_participated"] = user.first.student.has_participated
            student_hash["has_completed_form"] = user.first.student.has_completed_form
          end
          user.first.update_attributes(user_hash)
        else
          student_hash["has_participated"] = false
          student_hash["has_completed_form"] = true
          user_hash["is_admin"] = false
          
          User.create!(user_hash)
        end # end if !user.nil?


        if room_hash["preplaced"] == "preplaced"

          room_id = get_room(room_hash["dorm"], room_hash["room"])

          # Look for existing room assignments for the room
          roomAssignments = RoomAssignment.where(room_id: room_id)

          # If a room assignment exists, delete it!
          if roomAssignments.count != 0
            # Delete a pull associated if one exists
            if not roomAssignments.first.pull_id.nil?
              pull = Pull.find(id: roomAssignments.first.pull_id)
              pull.students.each { |student|
                subject = "Pull bumped"
                content = "Your pull has been bumped by an admin."
                GeneralMailer.send_email(student.user, subject, content)
              }
              pull.destroy
            # Else delete all room assignments associated with the room
            else
              roomAssignments.each do |assignment|
                assignment.destroy()
              end
            end
          end
          
          # Make the RoomAssignment for the preplaced student
          RoomAssignment.create!(:room_id => room_id, :assignment_type => "preplaced")
        end
        
        if room_hash["preplaced"] == "pulled"

          room_id = get_room(room_hash["dorm"], room_hash["room"])

          # Look for existing room assignments for the room
          roomAssignments = RoomAssignment.where(room_id: room_id)

          # If a room assignment exists, delete it!
          if roomAssignments.count != 0
            # Delete a pull associated if one exists
            if not roomAssignments.first.pull_id.nil?
              pull = Pull.find(id: roomAssignments.first.pull_id)
              pull.students.each { |student|
                subject = "Pull bumped"
                content = "Your pull has been bumped by an admin."
                GeneralMailer.send_email(student.user, subject, content)
              }
              pull.destroy
            # Else delete all room assignments associated with the room
            else
              roomAssignments.each do |assignment|
                assignment.destroy()
              end
            end
          end
          
        end
        
        if room_hash["preplaced"] == "frosh"

          room_id = get_room(room_hash["dorm"], room_hash["room"])

          # Look for existing room assignments for the room
          roomAssignments = RoomAssignment.where(room_id: room_id)

          # If a room assignment exists, delete it!
          if roomAssignments.count != 0
            # Delete a pull associated if one exists
            if not roomAssignments.first.pull_id.nil?
              pull = Pull.find(id: roomAssignments.first.pull_id)
              pull.students.each { |student|
                subject = "Pull bumped"
                content = "Your pull has been bumped by an admin."
                GeneralMailer.send_email(student.user, subject, content)
              }
              pull.destroy
            # Else delete all room assignments associated with the room
            else
              roomAssignments.each do |assignment|
                assignment.destroy()
              end
            end
          end
          
          # Make the RoomAssignment for the preplaced student
          RoomAssignment.create!(:room_id => room_id, :assignment_type => "freshman")
        end


      end # end CSV.foreach
    end
  end # end self.import(file)

  def has_student?
    !self.student.nil?
  end
end
