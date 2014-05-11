json.array!(@todos) do |todo|
  json.extract! todo, :id, :name, :description
  json.url todo_url(todo, format: :json)
end
