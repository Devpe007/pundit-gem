class PostPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin?
  end

  def update?
    user&.id == record.user_id
  end

  def edit?
    update?
  end

  def destroy?
    user&.id == record.user_id
  end
end
