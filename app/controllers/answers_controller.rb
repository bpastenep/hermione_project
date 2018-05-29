class AnswersController < ApplicationController

	def saveanswer
		tmp = Tmp.last
		idEvaluacion = tmp.evaluationActive_id
		idQuestion = params[:question_id]
		user_id = params[:user_id]
		respuesta = params[:respuesta]
		letra = params[:opcion]
		pregunta = Question.find(idQuestion)
		if (respuesta == pregunta.respuesta)
			correcto = true 
			tmp.update(correctAlternative: letra)
		else
			correcto = false
		end
		if Answer.create(question_id: idQuestion, evaluation_id: idEvaluacion, user_id: user_id, answer: respuesta, correct: correcto, alternativa: letra)
			puts "Respuesta guardada"
			flash[:succes] = "La respuesta ha sido guardada exitosamente" 
		else
			puts "No se ha podido guardar la alternativa"
		end
	end
end

