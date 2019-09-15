module Admin
  class StatisticPolicy < ApplicationPolicy
    alias_rule :posts_creation?, :posts_ratio?, to: :show?

    def show?
      user&.super_admin?
    end
  end
end
