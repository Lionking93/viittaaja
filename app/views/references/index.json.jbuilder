json.array!(@references) do |reference|
  json.extract! reference, :id, :referencelist_id, :year, :publisher, :author, :title, :address, :pages, :volume, :edition, :month, :series, :note
  json.url reference_url(reference, format: :json)
end
