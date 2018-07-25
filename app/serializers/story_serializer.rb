# frozen_string_literal: true

class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :typestory, :difficulty, :project_id, :editable

  def editable
    scope == object.project
  end
end
