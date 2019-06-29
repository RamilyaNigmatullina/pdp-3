module Admin
  class PendingPostPolicy < ApplicationPolicy
    def index?
      user&.super_admin?
    end

    def update?
      user&.super_admin? && record.pending?
    end
  end
end
