json.array!(@ratings) do |rating|
  json.extract! rating, :id, :movieId, :stars, :date, :User_id
  json.url rating_url(rating, format: :json)
end
