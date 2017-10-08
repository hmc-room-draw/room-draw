json.extract! room, :id, :floor, :number, :capacity, :dorm_id, :suite_id, :created_at, :updated_at
json.url room_url(room, format: :json)
