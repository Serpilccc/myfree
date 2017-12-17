json.extract! course, :id, :titre, :matiere, :fac, :annee, :created_at, :updated_at
json.url course_url(course, format: :json)
