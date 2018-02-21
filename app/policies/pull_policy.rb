# See https://github.com/elabs/pundit/ for an explanation of the code below
class PullPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    user.is_admin || @in_draw_period
  end

  def show?
    true
  end

  def create?
    user.is_admin || @in_draw_period
  end

  def update?
    user.is_admin
  end
  
  def edit?
    user.is_admin
  end

  def destroy?
    user.is_admin || (record.students.include?(user.student) && @in_draw_period)
  end
end
