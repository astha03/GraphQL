module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # field :all_links, [LinkType], null: false
    field :all_links, resolver: Resolvers::LinkSearch

    # def all_links
    #   Link.all
    # end
  end
end
