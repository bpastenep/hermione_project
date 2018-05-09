json.extract! question, :id, :tipo_pregunta, :enunciado, :respuesta, :respuestas_incor, :respuesta_incorrecta2, :respuesta_incorrecta3, :created_at, :updated_at
json.url question_url(question, format: :json)
