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
    @courses = Course.where(program_id: Tmp.last.program_id)
  end

    def datosReporteCurso
    @courses = Course.where(program_id: Tmp.last.program_id)
  end
end