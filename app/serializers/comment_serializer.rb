class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :content
  belongs_to :room
end
