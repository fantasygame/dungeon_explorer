json.array!(characters) do |character|
  json.extract! character, :id, :name, :experience, :team_id
  json.url character_url(character, format: :json)
end
