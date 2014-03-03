json.array!(@questions) do |question|
  json.extract! question, :id, :level_id, :category_id, :question
  json.url question_url(question, format: :json)
end
