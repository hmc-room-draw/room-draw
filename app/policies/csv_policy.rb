# See https://github.com/elabs/pundit/ for an explanation of the code below
class CSVPolicy < ApplicationPolicy
  def downloadPlacements?
    user.is_admin
  end

  def downloadNonParticipants?
    user.is_admin
  end
end
