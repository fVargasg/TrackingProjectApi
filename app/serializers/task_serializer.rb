class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :story_id, :editable

  def editable
    scope == object.story
  end
end
