# See https://github.com/elabs/pundit/ for an explanation of the code below
class LoginPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show
    true
  end
end
