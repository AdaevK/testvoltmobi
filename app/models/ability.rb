class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, Task, user_id: user.id
    end
  end
end
