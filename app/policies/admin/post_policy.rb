module Admin
  class PostPolicy < ApplicationPolicy
    def create?
      user&.admin?
    end

    def update?
      user&.admin? && record.user == user
    end

    def destroy?
      user&.admin? && record.user == user
    end
  end
end
