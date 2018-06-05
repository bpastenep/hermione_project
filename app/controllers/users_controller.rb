class UsersController < ApplicationController
	def import
		file = params[:file] 
		puts file.path
		User.import(params[:file])
		redirec_to programs_path, notice: "Alumnos agredos correctamente"
	end
end