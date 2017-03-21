class Ability
  include CanCan::Ability

  def initialize(user, session = nil)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.approved?
      can :manage, Message
      can :read, Newsfeed
      can :read, Newsletter
      can :read, TMaterial
      can [:update, :index], User, id: user.id
      can :index, Category
    end
  end
end
