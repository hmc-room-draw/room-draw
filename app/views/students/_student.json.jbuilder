json.extract! student, :id, :class_rank, :room_draw_number, :has_participated, :created_at, :updated_at
json.url student_url(student, format: :json)
