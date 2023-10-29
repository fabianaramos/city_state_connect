require 'net/http'

class ImportLocalesWorker
  include Sidekiq::Worker

  def perform(_id)
    JSON.parse(response).map do |locale|
      state = State.find_or_create_by!(name: locale['microrregiao']['mesorregiao']['UF']['nome'])
      state.cities.find_or_create_by!(name: locale['nome'])
    end
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
