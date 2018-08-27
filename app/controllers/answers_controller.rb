class AnswersController < ApplicationController

	def saveanswer
		tmp = Tmp.last
		idEvaluacion = tmp.evaluationActive_id
		idQuestion = params[:question_id]
		user_id = params[:user_id]
		respuesta = params[:respuesta]
		puts "Respuesta desde parametros #{respuesta}"
		letra = params[:opcion]
		pregunta = Question.find(idQuestion)
		proposito = pregunta.purpose
		if not Answer.where(user_id: user_id, evaluation_id: idEvaluacion, question_id: idQuestion ).last.nil?
			respuestaADestruir = Answer.where(user_id: user_id, evaluation_id: idEvaluacion, question_id: idQuestion).last
			pp respuestaADestruir
			respuestaADestruir.destroy
		end
		if (respuesta == pregunta.respuesta)
			correcto = true 
			tmp.update(correctAlternative: letra)
		else
			correcto = false
		end
		if Answer.create(question_id: idQuestion, evaluation_id: idEvaluacion, user_id: user_id, answer: respuesta, correct: correcto, alternativa: letra, purpose_id: proposito.id)
			flash[:succes] = "La respuesta ha sido guardada exitosamente" 
		else
			puts "No se ha podido guardar la alternativa"
		end
	end

	def saveanswergroups
		tmp = Tmp.last
		idEvaluacion = tmp.evaluationActive_id
		idQuestion = params[:question_id]
		user_id = params[:user_id]
		respuesta = params[:respuesta]
		puts "Respuesta desde parametros #{respuesta}"
		letra = params[:opcion]
		pregunta = Question.find(idQuestion)
		proposito = pregunta.purpose
		if not AnswerTemporal.where(user_id: user_id, evaluation_id: idEvaluacion, question_id: idQuestion ).nil?
			respuestaADestruir = AnswerTemporal.where(user_id: user_id).last
			respuestaADestruir.destroy
		end
		if (respuesta == pregunta.respuesta)
			correcto = true 
			tmp.update(correctAlternative: letra)
		else
			correcto = false
		end
		if AnswerTemporal.create(question_id: idQuestion, evaluation_id: idEvaluacion, user_id: user_id, answer: respuesta, correct: correcto, alternativa: letra, purpose_id: proposito.id)
			flash[:succes] = "La respuesta ha sido guardada exitosamente" 
		else
			puts "No se ha podido guardar la alternativa"
		end
	end
end

