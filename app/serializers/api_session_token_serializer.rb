class ApiSessionTokenSerializer < ActiveModel::Serializer
  attributes :token, :ttl
  has_one    :user
end