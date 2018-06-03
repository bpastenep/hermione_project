class HomeController < ApplicationController

  def index
  	@programs = Program.all
  end

#Funcion que carga en memoria los datos del programa seleccionado
  def cargarprograma
  	idProgram= params[:program_id]
  	puts idProgram
  	tmp = Tmp.last 
  	tmp.update(program_id: idProgram)
  	@program = Program.find(idProgram)
  	puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA #{@program.RdaGeneral.descripcion}"
  	@rdaG = @program.RdaGeneral
  	puts "ID RDAAAA GENERAL #{@rdaG.id}"
  	@rdaE = RdaEspecific.where(rda_general_id: @rdaG.id) 	
  end
end