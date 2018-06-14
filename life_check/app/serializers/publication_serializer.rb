class PublicationSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :title, :description, :user,:image
  def user
    object.user.name
  end
end
