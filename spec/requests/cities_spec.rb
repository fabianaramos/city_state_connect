require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  let(:state) { create(:state) }
  let!(:city) { create(:city, state: state) }

  describe 'GET /states/:state_id/cities.json' do
    it 'renders a successful response' do
      get "/states/#{state.id}/cities.json"

      expect(response).to have_http_status(:ok)
    end

    it 'renders a json with all cities from the state' do
      get "/states/#{state.id}/cities.json"

      expect(JSON.parse(response.body)).to include(
        {
          'id' => city.id,
          'name' => city.name,
          'state_id' => city.state_id,
          'created_at' => city.created_at.iso8601(3),
          'updated_at' => city.updated_at.iso8601(3)
        }
      )
    end
  end

  describe 'GET /states/:state_id/cities/:id.json' do
    it 'renders a successful response' do
      get "/states/#{state.id}/cities/#{city.id}.json"

      expect(response).to have_http_status(:ok)
    end

    it 'renders a json with all cities from the state' do
      get "/states/#{state.id}/cities/#{city.id}.json"

      expect(JSON.parse(response.body)).to include(
        {
          'id' => city.id,
          'name' => city.name,
          'state_id' => city.state_id,
          'created_at' => city.created_at.iso8601(3),
          'updated_at' => city.updated_at.iso8601(3)
        }
      )
    end
  end

  describe 'POST /states/:state_id/cities/:id.json' do
    let(:params) do
      { city:
       {
         name: 'São José dos Campos'
       } }
    end

    it 'renders a successful response' do
      post "/states/#{state.id}/cities.json", params: params

      expect(response).to have_http_status(:created)
    end

    it 'renders a json with all cities from the state' do
      post "/states/#{state.id}/cities.json", params: params

      city_id = JSON.parse(response.body)['id']
      city = City.find(city_id)

      expect(JSON.parse(response.body)).to include(
        {
          'id' => city.id,
          'name' => city.name,
          'state_id' => city.state_id,
          'created_at' => city.created_at.iso8601(3),
          'updated_at' => city.updated_at.iso8601(3)
        }
      )
    end
  end

  describe 'PUT /states/:state_id/cities/:id.json' do
    let(:params) do
      {
        city: {
          name: 'São José dos Campos'
        }
      }
    end

    it 'renders a successful response' do
      put "/states/#{state.id}/cities/#{city.id}.json", params: params

      expect(response).to have_http_status(:ok)
    end

    it 'renders a json with all cities from the state' do
      get "/states/#{state.id}/cities/#{city.id}.json", params: params

      city.reload

      expect(JSON.parse(response.body)).to include(
        {
          'id' => city.id,
          'name' => city.name,
          'state_id' => city.state_id,
          'created_at' => city.created_at.iso8601(3),
          'updated_at' => city.updated_at.iso8601(3)
        }
      )
    end
  end

  describe 'DELETE /states/:state_id/cities/:id.json' do
    it 'renders a successful response' do
      delete "/states/#{state.id}/cities/#{city.id}.json"

      expect(response).to have_http_status(:ok)
    end

    it 'renders a json with all cities from the state' do
      delete "/states/#{state.id}/cities/#{city.id}.json"

      expect(JSON.parse(response.body)).to include(
        {
          'id' => city.id,
          'name' => city.name,
          'state_id' => city.state_id,
          'created_at' => city.created_at.iso8601(3),
          'updated_at' => city.updated_at.iso8601(3)
        }
      )
    end
  end
end
