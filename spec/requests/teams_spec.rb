require 'rails_helper'
require 'swagger_helper'

RSpec.describe "Teams", type: :request do
  path '/teams' do
    get 'List teams' do
      tags 'Teams'
      produces 'application/json'

      response '200', 'teams listed' do
        before { create_list(:team, 2) }

        schema(
          type: :object,
          properties: {
            teams: {
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
          required: %i[teams]
        )

        run_test!
      end
    end
  end

  path '/teams/{id}' do
    get 'Show team' do
      tags 'Team'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, format: :uuid

      response '200', 'Show team' do
        let(:team) { create(:team) }
        let(:id) { team.id }

        before { create(:membership, team:) }

        schema(
          type: :object,
          properties: {
            id: { type: :string, format: :uuid },
            name: { type: :string },
            description: { type: :string },
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
                required: %i[id name roles]
              }
            }
          },
          required: %i[id name users]
        )

        run_test!
      end
    end
  end
end
