require 'rails_helper'

RSpec.describe 'ImportLocalesJobs', type: :routing do
  let!(:import_locales_job) { create(:import_locales_job) }

  describe 'GET /import_locales_jobs' do
    it 'renders a successful response' do
      get '/import_locales_jobs'

      expect(response).to have_http_status(:ok)
    end

    it 'renders a json with all cities from the state' do
      get '/import_locales_jobs'

      expect(JSON.parse(response.body)).to include(
        {
          'id' => import_locales_job.id,
          'created_at' => import_locales_job.created_at.iso8601(3),
          'updated_at' => import_locales_job.updated_at.iso8601(3)
        }
      )
    end
  end

  describe 'POST /import_locales_jobs' do
    it 'renders a successful response' do
      post '/import_locales_jobs'

      expect(response).to have_http_status(:ok)
    end

    it 'renders a json with all cities from the state' do
      post '/import_locales_jobs'

      import_locales_job_id = JSON.parse(response.body)['id']
      import_locales_job = ImportLocalesJob.find(import_locales_job_id)

      expect(JSON.parse(response.body)).to include(
        {
          'id' => import_locales_job.id,
          'created_at' => import_locales_job.created_at.iso8601(3),
          'updated_at' => import_locales_job.updated_at.iso8601(3)
        }
      )
    end
  end

  describe 'GET /import_locales_jobs/:id' do
    it 'renders a successful response' do
      get "/import_locales_jobs/#{import_locales_job.id}"

      expect(response).to have_http_status(:ok)
    end

    it 'renders a json with all cities from the state' do
      get "/import_locales_jobs/#{import_locales_job.id}"

      expect(JSON.parse(response.body)).to include(
        {
          'id' => import_locales_job.id,
          'created_at' => import_locales_job.created_at.iso8601(3),
          'updated_at' => import_locales_job.updated_at.iso8601(3)
        }
      )
    end
  end
end
