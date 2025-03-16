class PostPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    user&.has_role? :writer
  end

  def index?
    user.admin?
  end

  def update?
    user&.id == record.user_id || user&.has_role?(:editor)
  end

  def edit?
    update?
  end

  def destroy?
    user&.id == record.user_id || user.admin?
  end
end
