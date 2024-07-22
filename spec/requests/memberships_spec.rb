require 'rails_helper'
require 'swagger_helper'

RSpec.describe "Memberships", type: :request do
  path '/memberships' do
    context 'when membership parameters are valid' do
      post 'Create membership' do
        tags 'Membership Create'
        produces 'application/json'
        consumes 'application/json'

        parameter name: :membership, in: :body, schema: {
          type: :object,
          properties: {
            membership: {
              type: :object,
              properties: {
                team_id: { type: :string, format: :uuid },
                user_id: { type: :string, format: :uuid },
                role_id: { type: :string, format: :uuid }
              },
              required: %i[team_id user_id]
            }
          },
          required: %i[membership]
        }

        response '201', 'create membership' do
          let(:team) { create(:team) }
          let(:user) { create(:user) }
          let(:role) { create(:role) }
          let(:membership_attributes) do
            attributes_for(
              :membership,
              team_id: team.id,
              user_id: user.id,
              role_id: role.id
            )
          end
          let(:membership) { { membership: membership_attributes } }

          schema(
            type: :object,
            properties: {
              membership: {
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
                      name: { type: :string }
                    },
                    required: %i[id name]
                  }
                }
              }
            },
            required: %i[membership]
          )

          run_test!
        end
      end
    end
    context 'when membership is already created' do
      post 'Create membership' do
        tags 'Membership Create'
        produces 'application/json'
        consumes 'application/json'

        parameter name: :membership, in: :body, schema: {
          type: :object,
          properties: {
            membership: {
              type: :object,
              properties: {
                team_id: { type: :string, format: :uuid },
                user_id: { type: :string, format: :uuid },
                role_id: { type: :string, format: :uuid }
              },
              required: %i[team_id user_id]
            }
          },
          required: %i[membership]
        }

        response '422', 'could not create membership' do
          let(:team) { create(:team) }
          let(:user) { create(:user) }
          let(:role) { create(:role) }
          let(:membership_attributes) do
            attributes_for(
              :membership,
              team_id: team.id,
              user_id: user.id,
              role_id: role.id
            )
          end
          let(:membership) { { membership: membership_attributes } }

          before { create(:membership, team_id: team.id, user_id: user.id, role_id: role.id) }

          schema(
            type: :object,
            properties: {
              role_id: {
                type: :array,
                items: {
                  type: :string,
                  example: 'should be unique per team and role'
                }
              }
            },
            additionalProperties: {
              type: :array,
              items: {
                type: :string,
                example: "can't be blank"
              }
            }
          )

          run_test!
        end
      end
    end
  end
end
