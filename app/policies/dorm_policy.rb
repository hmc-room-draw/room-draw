# See https://github.com/elabs/pundit/ for an explanation of the code below
class DormPolicy < ApplicationPolicy
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
    user.is_admin
  end
  
  def edit?
    user.is_admin
  end

  def destroy?
    user.is_admin
  end
end
