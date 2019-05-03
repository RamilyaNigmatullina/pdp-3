module Admin
  class PostPolicy < ApplicationPolicy
    alias_rule :new?, :create?, to: :manage?

    def manage?
      user&.admin?
    end
  end
end
