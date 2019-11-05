json.extract! activity, :id, :title, :description, :start_time, :end_time, :event_type_id, :user_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
