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

  def status_sort
    if room_assignment.nil?
      if has_participated
        2
      else
        if has_completed_form
          1
        else
          0
        end
      end
    else
      3
    end
  end

  def format_status
    case status_sort
    when 0
      "Never logged in"
    when 1
      "Never pulled room"
    when 2
      "Participated, but not in room"
    when 3
      room_assignment.room.name
    end
  end
end
