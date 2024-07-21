require 'rails_helper'
require 'swagger_helper'

RSpec.describe "Users", type: :request do
  path '/users' do
    get 'List users' do
      tags 'Users'
      produces 'application/json'

      response '200', 'users listed' do
        before do
          create_list(:membership, 2)
        end

        schema(
          type: :object,
          properties: {
            users: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  id: { type: :string, format: :uuid },
                  name: { type: :string },
                  roles: {
                    type: :array,
                    items: {
                      type: :object,
                      properties: {
                        id: { type: :string, format: :uuid },
                        name: { type: :string },
                        description: { type: :string }
                      },
                      required: %i[id name]
                    }
                  }
                },
                required: %i[id name]
              }
            }
          },
          required: %i[users]
        )

        run_test!
      end
    end
  end

  path '/users/{id}' do
    get 'Show User' do
      tags 'User'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, format: :uuid

      response '200', 'Show user' do
        let(:membership) { create(:membership) }
        let(:user) { membership.user }
        let(:id) { user.id }

        schema(
          type: :object,
          properties: {
            user: {
              type: :object,
              properties: {
                id: { type: :string, format: :uuid },
                name: { type: :string },
                roles: {
                  type: :array,
                  items: {
                    type: :object,
                    properties: {
                      id: { type: :string, format: :uuid },
                      name: { type: :string },
                      description: { type: :string }
                    },
                    required: %i[id name]
                  }
                }
              }
            }
          },
          required: %i[user]
        )

        run_test!
      end
    end
  end
end
