# See https://github.com/elabs/pundit/ for an explanation of the code below
class RoomAssignmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.is_admin
  end

  def show?
    # I am keeping this to be true. However, once 
    # clients figure out the conditions of who can
    # see the room assignments, we can make rules
    true
  end

  def create?
    user.is_admin
  end

  def update?
    user.is_admin
  end

  def destroy?
    user.is_admin
  end
end
