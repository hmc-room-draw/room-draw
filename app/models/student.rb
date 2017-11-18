class Student < ApplicationRecord
  belongs_to :user

  has_one :room_assignment
  has_one :pull, through: :room_assignment
  has_one :pull
  
  enum class_rank: [:sophomore, :junior, :senior, :super_senior]

  scope :by_last_name, -> { joins(:user).order('users.last_name') }
  validates :class_rank, presence: true
  validates :room_draw_number, presence: true
  validates :user_id, uniqueness: true

  # student A outranks student B means A can bump B
  def outranks(other)
    (self.class_rank == other.class_rank and self.room_draw_number < other.room_draw_number) \
      or (self.class_rank > other.class_rank)
  end

  def senior?
    class_rank == :senior or class_rank == :super_senior
  end

  def format_status
    if room_assignment.nil?
      if has_participated
        "Participated, but not in room"
      else
        if has_completed_form
          "Never pulled room"
        else
          "Never logged in"
        end
      end
    else
      room_assignment.room.number
    end
  end
end
