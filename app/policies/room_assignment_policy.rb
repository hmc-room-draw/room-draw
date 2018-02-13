# See https://github.com/elabs/pundit/ for an explanation of the code below
class RoomAssignmentPolicy < ApplicationPolicy
  def index?
    user.is_admin
  end

  def new?
    user.is_admin
  end

  def new_from_pull?
    @in_draw_period
  end

  def show?
    user.is_admin
  end

  def create?
    user.is_admin
  end
  
  def edit?
    user.is_admin
  end

  def update?
    user.is_admin
  end

  def destroy?
    user.is_admin
  end

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
