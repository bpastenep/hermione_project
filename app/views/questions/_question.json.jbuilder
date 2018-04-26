json.extract! question, :id, :tipo_pregunta, :enunciado, :respuesta, :respuestas_incor, :created_at, :updated_at
json.url question_url(question, format: :json)
