class CheckAtivideSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id,:age_user,:title,:score
  has_one :user
end
