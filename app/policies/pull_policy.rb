# See https://github.com/elabs/pundit/ for an explanation of the code below
class PullPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
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
    user.is_admin
  end

  def destroy?
    user.is_admin || record.student == user.student
  end
end
