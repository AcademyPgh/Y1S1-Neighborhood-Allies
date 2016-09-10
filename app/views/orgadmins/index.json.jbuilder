json.array!(@orgnizations) do |orgadmin|
  json.extract! orgadmin, :id
  json.url orgadmin_url(orgadmin, format: :json)
end
