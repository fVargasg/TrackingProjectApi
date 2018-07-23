# frozen_string_literal: true

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :user_id, :editable

  def editable
    scope == object.user
  end
end
