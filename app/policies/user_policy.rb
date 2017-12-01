# See https://github.com/elabs/pundit/ for an explanation of the code below
class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.is_admin
  end

  def show?
    true
  end

  def create?
    user.is_admin
  end

  def update?
    user == record || user.is_admin
  end

  def destroy?
    user.is_admin
  end
end
