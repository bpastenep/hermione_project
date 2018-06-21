class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations = Evaluation.all
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
  end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
    @question = Question.all
    @courses = Course.all
  end 

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    puts evaluation_params
    @evaluation = Evaluation.new(evaluation_params)
     #De aca en adelante es para lograr insertar datos en la tabla intermedia 
    #La Tabla intermedia se la evaluation_question
    respond_to do |format|
      puts "Entre al respond"
      if @evaluation.save
        puts "Pude guardarlo"
        evaluation = Evaluation.last
        evaluation.update(course_id: params[:course_id])
        evaluation_id = evaluation.id
        question_ids = params[:questions]
        question_ids.each do |question_id|
          EvaluationQuestion.create(question_id: question_id, evaluation_id: evaluation_id)
        end
        format.html { redirect_to @evaluation, notice: 'La evaluación fue creada con éxito' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        @question = Question.all
        @courses = Course.all
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'La evaluación fue actualizada correctamente' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'La evaluación fue eliminada satisfactoriamente' }
      format.json { head :no_content }
    end
  end

  def active
    @evaluation = Evaluation.all
  end

  def activequestion
    @idEvaluation= params[:evaluation_id]
    evaluation = Evaluation.where(id: @idEvaluation).first
    @questions = evaluation.question
    @questions.each do |question|
      puts question.enunciado
    end
  end


  #Funcion que permite modficar el estado de una pregunta en la tabla evaluation_question. Cambiando el booleano
  #que existe por cada asociación. 
  def activarpregunta
    idEvaluacion =  params[:idEvaluation]
    idPregunta = params[:idPregunta]
    puts "idEvaluacion#{idEvaluacion} idPregunta#{idPregunta}"
    tmp = Tmp.last
    tmp.update(evaluationActive_id: idEvaluacion, flagAlternativas: true)
    preguntaAActivar = EvaluationQuestion.where(evaluation_id: idEvaluacion).where(question_id: idPregunta)
    if preguntaAActivar.update(logrado: true)
      puts "Pregunta activada"
    else
      puts "No se pudo activar la pregunta"
    end
  end

  def desactivarpregunta
    idEvaluacion =  params[:idEvaluation]
    idPregunta = params[:idPregunta]
    preguntaAActivar = EvaluationQuestion.where(evaluation_id: idEvaluacion).where(question_id: idPregunta)
    tmp = Tmp.last
    tmp.update(flagAlternativas: false)
    if preguntaAActivar.update(logrado: false)
      puts "Pregunta desactivada"
    else
      puts "No se pudo desactivar la pregunta"
    end
  end


  #Función encargada de la creación de grupos una vez finalizada una pregunta. 
  def crearGrupo 
    puts "entre a crear grupo"
    tmp = Tmp.last
    #Iniciación de variables que cuentan la cantidad de alternativas seleccionadas
    a=0
    b=0
    c=0
    d=0
    largo = 0
    userCorrecto = []
    temporal = []
    grupos = []
    contador = 0
    cantidadLogrado = 0
    userAnswer = Hash.new 
    puts params[:idPregunta]
    puts params[:idEvaluation]
    respuestas = Answer.where(question_id: params[:idPregunta], evaluation_id: params[:idEvaluation])
    cantidadIntegrantes = params[:cantidadIntegrantes]
    cantidadIntegrantes = Integer(cantidadIntegrantes)
    respuestas.each  do |respuesta|
      if respuesta.correct
        cantidadLogrado = cantidadLogrado + 1
      end
      userAnswer[respuesta.user_id] =  respuesta.alternativa
      if respuesta.alternativa == 'A'
        a = a+1
      elsif respuesta.alternativa == 'B'
        b = b+1
      elsif respuesta.alternativa == 'C'
        c = c+1 
      else
        d = d+1
      end
    end
    if userAnswer.length > 6 
      if (cantidadLogrado*100)/ userAnswer.length > 35 && (cantidadLogrado*100)/ userAnswer.length < 75 
        cantidadGrupos = userAnswer.length / cantidadIntegrantes
        if cantidadGrupos > 2
          userAnswer.each do |key, value|
            if value == tmp.correctAlternative
                userCorrecto << key
            else
                temporal << key 
            end
          end
          temporal.each do |userid|
            userCorrecto << userid
          end
          grupos = []
          (1..cantidadGrupos).each do |grupo|
            grupos << [userCorrecto.shift]
          end
          puts "Primeros grupos #{grupos}"
          userCorrecto.each_with_index do |user, index|
            grupos[index%cantidadGrupos] << user
          end
          puts "Grupos #{grupos}"
          User.asignarGrupo(grupos)
        else
            puts "No se pueden crear grupos, no cumple con la cantidad minima"    
        end
      else
        puts "Las respuestas correctas no son suficientes para armar grupos"
      end
    else 
      puts "No hay la cantidad de usuarios para generar grupos"
    end
 end

  def viewresult
    idEvaluacion =  params[:idEvaluation]
    idPregunta = params[:idPregunta]
    a = 0
    b = 0
    c = 0
    d = 0
    puts idPregunta
    respuestas = Answer.where(question_id: idPregunta, evaluation_id: idEvaluacion)
    respuestas.each do |respuesta|
      puts respuesta.alternativa
      if respuesta.alternativa == 'A'
        a+=1
      elsif respuesta.alternativa == 'B'
        b+=1
      elsif respuesta.alternativa == 'C'
        c+=1 
      else respuesta.alternativa == 'D'
        d+=1
      end
    end
    respond_to do |format|
      format.json {render :json =>{a: a, b:b, c:c ,d:d}}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:objetivo, :fecha, :course_id)
    end
end
