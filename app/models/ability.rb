class Ability
  include CanCan::Ability

  def initialize(user)
    # Handle the case where we don't have a current_user i.e. the user is a guest
    # user ||= User.new

    return unless user.present?

    can :read, :all
    can :manage, Post, author: user
    can :manage, Comment, author: user

    return unless user.role == 'admin'

    can :manage, :all
  end
end
