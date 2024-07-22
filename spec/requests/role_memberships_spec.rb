require 'rails_helper'
require 'swagger_helper'

RSpec.describe "RoleMemberships", type: :request do
  path '/role_memberships/{role_id}' do
    get 'Show role' do
      tags 'Role'
      produces 'application/json'
      parameter name: :role_id, in: :path, type: :string, format: :uuid

      response '200', 'Show role' do
        let(:membership) { create(:membership) }
        let(:role) { membership.role }
        let(:team) { membership.team }
        let(:user) { membership.user }
        let(:role_id) { role.id }

        schema(
          type: :object,
          properties: {
            role: {
              type: :object,
              properties: {
                id: { type: :string, format: :uuid },
                name: { type: :string },
                description: { type: :string },
                memberships: {
                  type: :array,
                  items: {
                    type: :object,
                    properties: {
                      id: { type: :string, format: :uuid },
                      role: {
                        type: :object,
                        properties: {
                          id: { type: :string, format: :uuid },
                          name: { type: :string },
                          description: { type: :string }
                        },
                        required: %i[id name]
                      },
                      team: {
                        type: :object,
                        properties: {
                          id: { type: :string, format: :uuid },
                          name: { type: :string },
                          description: { type: :string }
                        },
                        required: %i[id name]
                      },
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
                        },
                        required: %i[id name roles]
                      }
                    },
                    required: %i[id role team user]
                  }
                }
              },
              required: %i[id name memberships]
            }
          },
          required: %i[role]
        )

        run_test!
      end
    end
  end
end
