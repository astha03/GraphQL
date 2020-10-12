require 'test_helper'

module Mutations
    class SignInUserTest < ActiveSupport::TestCase
        def create_user
            User.create!(
                name: "Bob",
                email: "test@email.com",
                password:"[password]"
            )
        end 
        
        def perform(user:nil, **args)
            Mutations::SignInUser.new(object: nil, field: nil, context: {}).resolve(args)
        end

        test 'sign in is successful for correct email and password' do
            user = create_user
            result = perform(
                credentials: {
                    email: user.email,
                    password: user.password
                }
            )

            assert_equal true, result.present?
            assert_equal true, result[:token].present?
            assert_equal user, result[:user]     
        end

        test 'sign in fails if no credentials are passed in' do
            assert_nil perform
        end

        test 'sign in fails if user with given email does not exist' do
            result = perform(
                credentials: {
                    email: "wrong",
                    password: "wrong"
                }
            )
            assert_nil result
        end

        test 'sign in fails if user with given email exists but password is incorrect' do
            user = create_user
            result = perform(
                credentials: {
                    email: user.email,
                    password: "wrong"
                }
            )
            assert_nil result
        end

    end 
end 
