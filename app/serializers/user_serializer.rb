class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :token, :password_digest
end
