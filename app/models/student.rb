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

  scope :by_last_name, -> { joins(:user).order('users.last_name') }
  validates :class_rank, presence: true
  validates :room_draw_number, presence: true
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
    class_rank == :senior or class_rank == :super_senior
  end

  def number_sort
    # convert class rank to a number or it sorts as a string
    [Student.class_ranks[class_rank], number_is_last ? 1 : 0, room_draw_number]
  end

  def format_number
    if number_is_last
      class_rank + " last " + room_draw_number.to_s
    else
      class_rank + " " + room_draw_number.to_s
    end
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
