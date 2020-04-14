class Student < ApplicationRecord
  belongs_to :user

  has_one :room_assignment
  has_one :pull, through: :room_assignment
  has_one :pull

  enum class_rank: {
    :sophomore => 3,
    :junior => 2,
    :senior => 0,
    :super_senior => 1,
  }

  enum status: {
    :never_logged_in => 0,
    :never_pulled_room => 1,
    :formerly_in_room => 2,
    :in_room => 3,
  }

  scope :by_last_name, -> { joins(:user).order('users.last_name') }
  validates :class_rank, presence: true
  validates :room_draw_number, presence: true, uniqueness: true
  validates_each :room_draw_number do |record, attr, value|
    record.errors.add(attr, 'must be integer or .5') if (value*2) % 1 != 0
    record.errors.add(attr, 'must be nonnegative') if value < 0
  end
  validates :user_id, uniqueness: true

  # student A outranks student B means A can bump B
  def outranks(other)
    my_rank = Student.class_ranks[self.class_rank]
    their_rank = Student.class_ranks[other.class_rank]

    if my_rank == their_rank then
      if self.number_is_last == other.number_is_last then
        return self.room_draw_number < other.room_draw_number
      else
        return other.number_is_last
      end
    else
      # older class_ranks are smaller numbers so sorting is simpler
      # thus, if my_rank is smaller than their_rank, I outrank them
      return my_rank < their_rank
    end
  end

  def senior?
    class_rank == "senior" or class_rank == "super_senior"
  end

  def number_sort
    # convert class rank to a number or it sorts as a string
    # also add leading zeros onto the room draw number so sorting as a string sorts correctly.
    [Student.class_ranks[class_rank], number_is_last ? 1 : 0, room_draw_number.to_s.rjust(5, "0")]
  end

  def format_number
    if number_is_last
      class_rank + " last " + room_draw_number.to_s
    else
      class_rank + " " + room_draw_number.to_s
    end
  end

  def status_sort
    Student.statuses[status]
  end

  def student_name
    self.user.first_name + " " + self.user.last_name
  end

  def status
    if room_assignment.nil?
      if has_participated
        :formerly_in_room
      else
        if has_completed_form
          :never_pulled_room
        else
          :never_logged_in
        end
      end
    else
      :in_room
    end
  end

  def student_name_and_number
    user = self.user
    format_number + " " + user.first_name + " " + user.last_name
  end

  def student_name
    user = self.user
    user.first_name + " " + user.last_name
  end


  def format_status
    case status
    when :never_logged_in
      "Never logged in"
    when :never_pulled_room
      "Never pulled room"
    when :formerly_in_room
      "Participated, but not in room"
    when :in_room
      room_assignment.room.name
    end
  end

  def format_rank
    case class_rank
    when :senior
      "Senior"
    when :junior
      "Junior"
    when :sophomore
      "Sophomore"
    when :super_senior
      "Super-senior"
    end
  end
end
