class ParagraphPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    record.folder.user == user
  end

  def destroy?
    record.folder.user == user

  end

  def update?
    record.folder.user == user
  end
end
