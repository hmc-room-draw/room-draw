# See https://github.com/elabs/pundit/ for an explanation of the code below
class PullPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    false
  end
  
  def edit?
    user.is_admin
  end

  def destroy?
    user.is_admin || record.students.include?(user.student)
  end
end
