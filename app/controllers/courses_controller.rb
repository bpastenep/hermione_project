class CoursesController < ApplicationController

	def guardarcurso 
		nombre = params[:nombre]
		curso = Course.create(descripcion: nombre, program_id: params[:program_id])
		puts "se ha creado el curso"
		csv_file = CsvUploader.new
		csv_file.cache!(params[:file])
		CSV.foreach(csv_file.path, headers: true) do |row|
			puts row.to_hash
			respond = User.where(id: row["rut"]).last
			 #respond = curso.user.create! row.to_hash
			if respond.nil?
			 	curso.user.create! row.to_hash			 	
			else
			 	usuario = User.where(rut: respond.rut).last
			 	CourseUser.create(course_id: curso.id, user_id: usuario.id)	
			end 			 
		end		
	end

	def createcourse
		@programs = Program.all
	end

	def show
		tmp = Tmp.last
		@courses = Course.where(program_id: tmp.program_id) 
	end

	def crearReporteAlumno
		puts "AAAAAAAAAAAAAAAAAAAAAAA"
		rutAlumno = params[:rut]
		user = User.where(rut: rutAlumno).last
		idCurso = params[:course_id]
		curso = Course.find(idCurso)
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
		puts "AAAAAAAAAAAAH"
		propositos_id = []
		correcta = []
		respuestas.each do |respuesta|
			propositos_id << respuesta.purpose_id
			correcta << respuesta.correct
		end
		pp propositos_id
		pp correcta
		repetir = []
		ids = []
		hashIdsPropositosCantidad = Hash.new 
		for i in 0..propositos_id.length-1
			cantidad = 0 
			cantidadBuenas = 0
		    if not repetir.include? propositos_id[i]
				repetir << propositos_id[i]
				cantidad = propositos_id.count(propositos_id[i])
				puts "cantidad #{cantidad}"
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
		pp hashIdsPropositosCantidad
=begin
		evaluaciones = curso.evaluation
		questions_id = []
		evaluations_id = []
		respuestas = []
		evaluaciones.each do |evaluacion|
			questions_id << evaluacion.question.ids
			evaluation_id << evaluacion.id
		end
		#El siguiente bloque de codigo genera un array con todas las respuestas (Answer model) que ha dado el usuario para el curso seleccionado. 
		evaluation_id.each do |id_eval|
			questions_id.each do |arrayIdsQuestion|
				arrayIdsQuestion.each do |question_id|
					respuestas << Answer.where(evaluation_id: id_eval, user_id: user.id, question_id: question_id).last
				end
			end
		end
		arrayFinal = []  
		respuestas.each do |respuesta|
			pregunta = Question.where(question_id: respuesta.question_id).last
			proposito = pregunta.purpose 
			arrayFinal << [proposito.id, respuesta.correct]
		end
		@conteoPropositos = Hash.new
		@respuestaPropositos = Hash.new
		contadorTotal = 0 
		contadorAlumno = 0
		arrayFinal.each do |arrayPropositos|
			@conteoPropositos[arrayPropositos[0]] = 0
			@respuestaPropositos[arrayPropositos[0]] = 0
		end
		# hash[id_proposito] = cantidad 
		arrayFinal.each do |arrayPropositos|
			@conteoPropositos[arrayPropositos[0]] = @conteoPropositos[arrayPropositos[0]] + 1
			if arrayPropositos[1]
				@respuestaPropositos[arrayPropositos[0]] = @espuestaPropositos[arrayPropositos[0]] + 1
			end 
		end
=end
	end

=begin
	def crearReporteCurso
		id_curso = params[:id_curso]
		curso = Course.find(id_curso)
		alumnos = curso.user
		evaluaciones = curso.evaluation

		alumnos.each do |alumno| 

		
	end
=end 
end