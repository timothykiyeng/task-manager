class CommentSerializer < ActiveModel::Serializer
  attributes :id, :description, :user_id, :task_id
end
