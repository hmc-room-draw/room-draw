# See https://github.com/elabs/pundit/ for an explanation of the code below
class SessionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    true
  end
end
