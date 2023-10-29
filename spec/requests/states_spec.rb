require 'rails_helper'

RSpec.describe 'States', type: :request do
  let!(:state) { create(:state) }

  describe 'GET /states.json' do
    it 'renders a successful response' do
      get '/states.json'

      expect(response).to have_http_status(:ok)
    end

    it 'renders a json with all states' do
      get '/states.json'

      expect(JSON.parse(response.body)).to include(
        {
          'id' => state.id,
          'name' => state.name,
          'created_at' => state.created_at.iso8601(3),
          'updated_at' => state.updated_at.iso8601(3)
        }
      )
    end
  end

  describe 'GET /states/:state_id.json' do
    it 'renders a successful response' do
      get "/states/#{state.id}.json"

      expect(response).to have_http_status(:ok)
    end

    it 'renders a json with all cities from the state' do
      get "/states/#{state.id}.json"

      expect(JSON.parse(response.body)).to include(
        {
          'id' => state.id,
          'name' => state.name,
          'created_at' => state.created_at.iso8601(3),
          'updated_at' => state.updated_at.iso8601(3)
        }
      )
    end
  end

  describe 'POST /states/:state_id.json' do
    let(:params) do
      { state:
       {
         name: 'Maranhão'
       } }
    end

    it 'renders a successful response' do
      post '/states.json', params: params

      expect(response).to have_http_status(:created)
    end

    it 'renders a json with all cities from the state' do
      post '/states.json', params: params

      state_id = JSON.parse(response.body)['id']
      state = State.find(state_id)

      expect(JSON.parse(response.body)).to include(
        {
          'id' => state.id,
          'name' => state.name,
          'created_at' => state.created_at.iso8601(3),
          'updated_at' => state.updated_at.iso8601(3)
        }
      )
    end
  end

  describe 'PUT /states/:state_id.json' do
    let(:params) do
      {
        state: {
          name: 'Paraná'
        }
      }
    end

    it 'renders a successful response' do
      put "/states/#{state.id}.json", params: params

      expect(response).to have_http_status(:ok)
    end

    it 'renders a json with all cities from the state' do
      get "/states/#{state.id}.json", params: params

      state.reload

      expect(JSON.parse(response.body)).to include(
        {
          'id' => state.id,
          'name' => state.name,
          'created_at' => state.created_at.iso8601(3),
          'updated_at' => state.updated_at.iso8601(3)
        }
      )
    end
  end

  describe 'DELETE /states/:state_id.json' do
    it 'renders a successful response' do
      delete "/states/#{state.id}.json"

      expect(response).to have_http_status(:ok)
    end

    it 'renders a json with all cities from the state' do
      delete "/states/#{state.id}.json"

      expect(JSON.parse(response.body)).to include(
        {
          'id' => state.id,
          'name' => state.name,
          'created_at' => state.created_at.iso8601(3),
          'updated_at' => state.updated_at.iso8601(3)
        }
      )
    end
  end
end
