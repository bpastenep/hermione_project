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
		@course = Course.last
		tablaIntermedia = CourseUser.where(@course.id)
		@user = []
		tablaIntermedia.each do |cursouser| 
			@users << User.find(cursouser.user_id)
		end 
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
		propositos_id = []
		correcta = []
		respuestas.each do |respuesta|
			propositos_id << respuesta.purpose_id
			correcta << respuesta.correct
		end
		repetir = []
		ids = []
		@hashIdsPropositosCantidad = Hash.new 
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
			@hashIdsPropositosCantidad[propositos_id]=[cantidad,cantidadBuenas]
		end
		@propositos = []
		@hashIdsPropositosCantidad.each do |key, value|
			@propositos << Purpose.find(key)
		end
	end


	def crearReporteCurso
		id_curso = params[:course_id]
		curso = Course.find(id_curso)
		alumnos = curso.user
		pp alumnos
		evaluaciones = curso.evaluation
		azul = []
		alumnos.each do |alumno| 
			azul << Course.crearReportePorAlumno(alumno.rut,curso.id)
		end
		pp azul
	end
end