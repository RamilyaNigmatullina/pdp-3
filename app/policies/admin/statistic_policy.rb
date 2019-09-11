module Admin
  class StatisticPolicy < ApplicationPolicy
    def show?
      user&.super_admin?
    end
    alias_method :posts_creation?, :show?
    alias_method :posts_ratio?, :show?
  end
end
