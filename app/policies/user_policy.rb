class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.is_ashmc_admin || user.is_super_admin
  end

  def show?
    true
  end

  def create?
    user.is_ashmc_admin || user.is_super_admin
  end

  def update?
    user == record
  end

  def destroy?
    user.is_ashmc_admin || user.is_super_admin
  end
end
