json.array!(@references) do |reference|
  json.extract! reference, :reference_type, :id, :year, :publisher, :author, :title, :address, :pages, :volume, :edition, :month, :series, :note
end
