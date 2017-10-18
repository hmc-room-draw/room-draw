json.extract! room_assignment, :id, :assignment_type, :description, :student_id, :pull_id, :room_id, :created_at, :updated_at
json.url room_assignment_url(room_assignment, format: :json)
