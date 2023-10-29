require 'net/http'

class ImportLocalesWorker
  include Sidekiq::Worker

  def perform(id)
    @import_locales_job = ImportLocalesJob.find(id)

    JSON.parse(response).map do |locale|
      state = State.find_or_create_by!(name: locale['microrregiao']['mesorregiao']['UF']['nome'])
      state.cities.find_or_create_by!(name: locale['nome'])
    end

    @import_locales_job.update!(status: :finished)
  rescue StandardError => e
    raise
    @import_locales_job.update!(status: :failed)
  end

  def uri
    URI('https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome')
  end

  def response
    Net::HTTP.get(
      uri,
      {
        'Content-Type' => 'application/json'
      }
    )
  end
end
