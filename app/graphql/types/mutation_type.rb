module Types
  class MutationType < Types::BaseObject
    field :register, Types::UserType, mutation: Mutations::Register
    field :login, Types::LoginType, mutation: Mutations::Login
  end
end
