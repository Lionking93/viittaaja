json.array!(@referencelists) do |referencelist|
  json.extract! referencelist, :id, :user_id, :name
  json.url referencelist_url(referencelist, format: :json)
end
