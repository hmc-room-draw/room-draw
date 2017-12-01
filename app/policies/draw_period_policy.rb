# See https://github.com/elabs/pundit/ for an explanation of the code below
class DrawPeriodPolicy < ApplicationPolicy
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
