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
  	@rdaG = @program.RdaGeneral
  	@rdaE = RdaEspecific.where(rda_general_id: @rdaG.id) 	
  end


  def datosReporteAlumno
    puts "Entre a verificar los datos del reporte"
    @courses = Course.all
  end
end