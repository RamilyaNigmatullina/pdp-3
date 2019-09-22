module Admins
  class PendingPostPolicy < ApplicationPolicy
    def index?
      user&.admin?
    end

    def update?
      user&.admin? && record.pending?
    end
  end
end
