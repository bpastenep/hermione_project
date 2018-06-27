class Course < ApplicationRecord
	has_many :evaluation, dependent: :destroy
	has_many :course_user, dependent: :destroy
	has_many :user, through: :course_user, dependent: :destroy
	belongs_to :program

	def crearReportePorAlumno(rut, course_id)
		rutAlumno = rut
		user = User.where(rut: rutAlumno).last
		curso = Course.find(course_id)
		respuestas = []
		curso.evaluation.each do |e|
				e.question.each do |q|
					 ans = q.answer.where(user_id: user.id).last
					 if not ans.nil?
					 	if not respuestas.include? ans
					 		respuestas << ans 
					 	end
					 end
			end
		end
		propositos_id = []
		correcta = []
		respuestas.each do |respuesta|
			propositos_id << respuesta.purpose_id
			correcta << respuesta.correct
		end
		repetir = []
		ids = []
		hashIdsPropositosCantidad = Hash.new 
		for i in 0..propositos_id.length-1
			cantidad = 0 
			cantidadBuenas = 0
		    if not repetir.include? propositos_id[i]
				repetir << propositos_id[i]
				cantidad = propositos_id.count(propositos_id[i])
				for j in 0..propositos_id.length-1
					if propositos_id[i] == propositos_id[j]
						if correcta[j]
							cantidadBuenas = cantidadBuenas+1
						end
					end 
				end
			end
			hashIdsPropositosCantidad[propositos_id]=[cantidad,cantidadBuenas]
		end
		return hashIdsPropositosCantidad
	end

end
