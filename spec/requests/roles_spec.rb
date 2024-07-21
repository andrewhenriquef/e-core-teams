require 'rails_helper'
require 'swagger_helper'

RSpec.describe "Roles", type: :request do
  path '/roles' do
    get 'List roles' do
      tags 'Roles'
      produces 'application/json'

      response '200', 'roles listed' do
        before { create_list(:role, 1) }

        schema(
          type: :object,
          properties: {
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
          required: %i[roles]
        )

        run_test!
      end
    end
  end

  path '/roles/{id}' do
    get 'Show role' do
      tags 'Role'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, format: :uuid

      response '200', 'Show role' do
        let(:role) { create(:role) }
        let(:id) { role.id }

        schema(
          type: :object,
          properties: {
            role: {
              type: :object,
              properties: {
                id: { type: :string, format: :uuid },
                name: { type: :string },
                description: { type: :string }
              },
              required: %i[id name]
            }
          },
          required: %i[role]
        )

        run_test!
      end
    end
  end
end
