class UsersController < ApplicationController
	def import 
		puts "entre a la funcion importaaaaaaaaaaaaaaaaaaaaaar"
		User.import(params[:file])
		redirecto programs_path, notice: "Alumnos agredos correctamente"
end