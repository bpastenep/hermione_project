class CoursesController < ApplicationController

	def guardarcurso
		curso = Course.new
		curso.nomina = params[:file]	
		curso.nomina.each do |f|
			puts f
		end
		#User.import(params[:file])
		#redirec_to programs_path, notice: "Alumnos agredos correctamente"
	end
end