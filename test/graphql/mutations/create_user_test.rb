require 'test_helper'

module Mutations
    class CreateUserTest < ActiveSupport::TestCase
        def perform(user: nil, **args)
            Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(args)
        end

        test 'create a new user' do
            user = perform(
                name: 'Bob',
                auth_provider: {
                    credentials: {
                      email: 'test@email.com',
                      password: '[password]'
                    }
                  }
            )

            assert_equal true, user.persisted?
            assert_equal "Bob", user.name 
            assert_equal "test@email.com", user.email
            assert_equal "[password]", user.password
        end
   end
end 


