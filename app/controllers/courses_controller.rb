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
		flash[:succes] = "El curso ha sido creado exitosamente"
	end

	def createcourse
		@programs = Program.all
	end

	def seleccionarParaVer
		program_id = Tmp.last.program_id
		@course = Course.where(program_id: program_id)
	end

	def show
		@course = Course.find(params[:curso_id])
		@user = @course.user
		
	end

	def crearReporteAlumno
		rutAlumno = params[:rut]
		@user = User.where(rut: rutAlumno).last
		idCurso = params[:course_id]
		curso = Course.find(idCurso)
		respuestas = []
		curso.evaluation.each do |e|
  			e.question.each do |q|
   				 ans = q.answer.where(user_id: @user.id).last
   				 if not ans.nil?
   				 	if not respuestas.include? ans
   				 		respuestas << ans 
   				 	end
   				 end
			end
		end
		puts "respuestas"
		pp respuestas
		propositos_id = []
		correcta = []
		respuestas.each do |respuesta|
			propositos_id << respuesta.purpose_id
			correcta << respuesta.correct
		end
		puts "corroectas y propositos_id"
		pp correcta
		pp propositos_id
		repetir = []
		ids = []
		@hashIdsPropositosCantidad = Hash.new 
		for i in 0..propositos_id.length-1
			cantidad = 0 
			cantidadBuenas = 0
			puts "propositos_id[i] -> #{propositos_id[i]}"
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
			@hashIdsPropositosCantidad[propositos_id[i]]=[cantidad,cantidadBuenas]
		end
		pp @hashIdsPropositosCantidad
		@propositos = []
		@hashIdsPropositosCantidad.each do |key, value|
			@propositos << Purpose.find(key)
		end
		pp @propositos
	end


	def crearReporteCurso
		id_curso = params[:course_id]
		curso = Course.find(id_curso)
		alumnos = curso.user
		evaluaciones = curso.evaluation
		@resultadoCurso = Hash.new
		propositos_id = []
		alumnos.each do |alumno| 
			if not alumno.rut == current_user.rut 
				@resultadoCurso[alumno.rut] = Course.crear_reporte(alumno.rut,curso.id)
			end
		end
		@resultadoCurso.each do |rut,hashProposito|
			hashProposito.each do |idProposito,values|
				puts "idProposito = #{idProposito}"
				propositos_id << idProposito
				break
			end
			break
		end
		pp "proposito_id #{propositos_id}"
		@propositos = []
		propositos_id.each do |idProposito|
			@propositos << Purpose.find(idProposito)
		end
		puts "Proposito 0 = #{@propositos[0][0]}"
		puts "Proposito 1 = #{@propositos[0][1]}"
		pp @resultadoCurso
	end 	


	def responderPorGrupo
	active = EvaluationQuestion.where(logrado: true)
    if active.nil?
      @resultado = nil
      puts "No existen preguntas activas"
    else
      respuestas = Array.new(4)
      @respuestasD = Array.new(4)
      tmp = Tmp.last
      active.each do |pregunta|
        idPregunta = pregunta.question_id
        @resultado = Question.find(idPregunta)
        if @resultado.nil?
          puts "no encontré preguntas con ese id"
        else
        puts "BBBBBBBBBBBBBBB #{@resultado}"
      end 
      respuestas[0]=@resultado.respuesta
      tmp.correctAlternative = @resultado.respuesta
      respuestas[1]=@resultado.respuestas_incor
      respuestas[2]=@resultado.respuesta_incorrecta2
      respuestas[3]=@resultado.respuesta_incorrecta3
      if tmp.flagAlternativas
        @respuestasD = respuestas.shuffle
        puts @respuestasD[0]
        puts @respuestasD[1]
        puts @respuestasD[2]
        puts @respuestasD[3]
        tmp.update(a: @respuestasD[0], b: @respuestasD[1], c: @respuestasD[2], d: @respuestasD[3], flagAlternativas: false) 
      else
        @respuestasD[0]= tmp.a
        @respuestasD[1]= tmp.b
        @respuestasD[2]= tmp.c
        @respuestasD[3]= tmp.a
      end
    end
  end

  end
end