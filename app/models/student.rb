class Student < ApplicationRecord
  validates :class_rank, presence: true
  validates :room_draw_number, presence: true

  belongs_to :user

  has_one :room_assignment
  has_one :pull, through: :room_assignment
  has_one :pull

  enum class_rank: [:freshman, :sophomore, :junior, :senior]

  # Import users from a csv file
  # Checks to see if the student exists in the database.
  # If the student exists, it will attempt to update the student.
  # If not, it will create a new student.
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      student_hash = row.to_hash

      user = User.where(email: student_hash["email"])

      puts student_hash["email"]

      puts user.attributes[:id]

      puts "ID"
      puts user.attributes['id']

      student = Student.where(user.attributes['id'])

      if student.count == 1
        student.first.update_attributes(student_hash.except("email"))
      else
        st = Student.create!(student_hash.except("email"))
        st.user_id = user.attributes['id']
        st.save!
      end # end if !student.nil?

    end # end CSV.foreach
  end # end self.import(file)

end
