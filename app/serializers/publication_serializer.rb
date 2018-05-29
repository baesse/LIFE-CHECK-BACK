class PublicationSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :title, :description, :user
  def user
    object.user.name
  end
end
