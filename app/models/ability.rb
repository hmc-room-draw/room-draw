class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # not logged in

    if user.role == "ASHMC_admin"?
      # TODO: privacy protections
      can :manage, :all

    elsif user.role == "super_admin"?
      can :manage, :all

    else
      # TODO: limit permissions
      can :manage, :all
    
    end
  end
end
