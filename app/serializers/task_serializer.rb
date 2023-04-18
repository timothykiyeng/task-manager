class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :completed, :user_id
end
