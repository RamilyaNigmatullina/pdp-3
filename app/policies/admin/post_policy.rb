module Admin
  class PostPolicy < ApplicationPolicy
    def new?
      user&.admin?
    end

    def edit?
      user&.admin? && record.user == user
    end
  end
end
