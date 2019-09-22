module Admins
  class StatisticPolicy < ApplicationPolicy
    alias_rule :posts_creation?, :posts_ratio?, to: :show?

    def show?
      user&.admin?
    end
  end
end
