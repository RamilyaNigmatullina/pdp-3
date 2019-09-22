module Users
  class PostPolicy < ApplicationPolicy
    def create?
      user&.user?
    end

    def update?
      user&.user? && record.user == user
    end

    def destroy?
      user&.user? && record.user == user
    end
  end
end
