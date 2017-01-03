class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.approved?
      can :manage, Message
      can :read, Newsfeed
      can :read, Newsletter
      can :read, TMaterial
      can [:update], User, id: user.id
  end
end