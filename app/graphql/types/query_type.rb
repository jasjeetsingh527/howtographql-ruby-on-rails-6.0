module Types
  class QueryType < BaseObject
    field :all_links, function: Resolvers::LinksSearch

    # this method is invoked, when `all_link` fields is being resolved
    def all_links
      Link.all.order(id: :desc)
    end
  end
end
