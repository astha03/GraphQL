require 'test_helper'

module Mutations
    class CreateLinkTest < ActiveSupport::TestCase
        def perform(user: nil, **args)
            Mutations::CreateLink.new(object: nil, field: nil, context: {}).resolve(args)
        end

        test 'create a new link' do
            link = perform(
                url: "http://example.com",
                description: "description"
            )

            assert_equal true, link.persisted?
            assert_equal "description", link.description 
            assert_equal "http://example.com", link.url
        end
   end
end 

