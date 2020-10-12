require 'search_object'
require 'search_object/plugin/graphql'

module Resolvers
    class LinkSearch
        include SearchObject.module(:graphql)

        scope {Link.all}

        type [Types::LinkType]

        option :first, type: types.Int, with: :apply_first
        option :skip, type: types.Int, with: :apply_skip

        def apply_first(scope, value)
            scope.limit(value)
        end
        
        def apply_skip(scope, value)
            scope.offset(value)
        end
    end
end

