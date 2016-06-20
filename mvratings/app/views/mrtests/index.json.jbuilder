json.array!(@mrtests) do |mrtest|
  json.extract! mrtest, :id, :first
  json.url mrtest_url(mrtest, format: :json)
end
