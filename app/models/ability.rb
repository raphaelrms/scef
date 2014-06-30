class Ability
  include CanCan::Ability

    def initialize(user)
      if !user.nil?
        user.roles.each do |role|
          role.permissions.each do |permission|
          if permission.subject_id.nil? || permission.subject_id != 0
            if permission.condition.nil?
              can permission.action.to_sym, (permission.subject_class.mb_chars.downcase.to_s== "all") ? :all : permission.subject_class.constantize
            else
              can permission.action.to_sym, permission.subject_class.constantize, :id => eval(permission.condition)
            end
          else
            can permission.action.to_sym, permission.subject_class.constantize, :id => (permission.subject_id == 0 ? user.id : permission.subject_id )
          end
          end
        end
      else
        user ||= User.new # guest user (not logged in)
      end
    end


    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end