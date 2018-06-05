class CoursesController < ApplicationController

	def guardarcurso
		puts "AAAAAAAALO"
		uploader = CsvcursoUploader.new
		uploader.store!(params[:file])
		datos = CsvcursoUploader.last
		contenido = datos.attachment.read
		puts contenido 

		#User.import(params[:file])
		#redirec_to programs_path, notice: "Alumnos agredos correctamente"
	end
end