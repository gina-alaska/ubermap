class ManagerAbility
  include CanCan::Ability

  def initialize(organization, user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    can :read, :all
    cannot :read, User

    if user.admin?
      can :manage, :all
      cannot :manage, User, id: user.id
    else
      if organization && organization.users.include?(user)
        can :update, Organization, id: organization.id
        can :manage, [Multimap, GeojsonLayer, WmsLayer, OrganizationsUser], organization_id: organization.id
      end

      # can :delete, [Multimap, GeojsonLayer, OrganizationsUser] do |item|
      #   item.organization.users.include?(user)
      # end
      #
      # can [:available, :add, :remove], Multimap do |item|
      #   item.organization.users.include?(user)
      # end

      #TODO Update these when they become nested in organization
      can :manage, [Map]
    end
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
