module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :users, [Types::UserType], null: false,
    field :users, Types::UserType, null: false,
      description: "An example field added by the generator"
    def users
      # user = authenticate!
      # user
      User.all
    end
  end
end
