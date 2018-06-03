class UsersController < ApplicationController
	def import 
		User.import(params[:file])
		redirecto programs_path, notice: "Alumnos agredos correctamente"
end