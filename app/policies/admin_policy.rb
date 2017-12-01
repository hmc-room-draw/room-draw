# See https://github.com/elabs/pundit/ for an explanation of the code below
class AdminPolicy < ApplicationPolicy
  def edit_mark?
    user.is_admin
  end

  def add_mark?
    user.is_admin
  end

  def delete_mark?
    user.is_admin
  end

  def get_room?
    user.is_admin
  end
end
