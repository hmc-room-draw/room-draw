json.extract! student, :id, :class, :room_draw_number, :has_participated, :created_at, :updated_at
json.url student_url(student, format: :json)
