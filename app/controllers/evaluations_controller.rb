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
  end 

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)
     #De aca en adelante es para lograr insertar datos en la tabla intermedia 
    #La Tabla intermedia se lla evaluation_question
    respond_to do |format|
      if @evaluation.save
        evaluation = Evaluation.last
        evaluation_id = evaluation.id
        question_ids = params[:questions]
        question_ids.each do |question_id|
          EvaluationQuestion.create(question_id: question_id, evaluation_id: evaluation_id)
        end
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
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
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
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
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
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

  #Función encargada de la creación de grupos una vez finalizada una pregunta. 
  def creargrupos
    
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

  def crearGrupo
=begin
    tmp = Tmp.last
    userAnswer = Hash.new 
    respuestas = Answer.where(question_id: params[:question_id], evaluation_id: params[:evaluation_id])
    respuestas.each |respuesta| do
      userAnswer[respuesta.user_id] = respuesta.alternativa
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
    cantidad = a+b+c+d
    seleccionCorrecta = tmp.correctAlternative
    case seleccionCorrecta
      when "A" 
        if ((a*100)/cantidad > 35 && (a*100)/cantidad < 75 ) 
          puts "Se pueden crear grupos"
        else
          puts "No se pueden crear grupos"  
        end
      when "B" 
        if ((b*100)/cantidad > 35 && (b*100)/cantidad < 75 ) 
          puts "Se pueden crear grupos"
        else
          puts "No se pueden crear grupos"  
        end
      when "C" 
        if ((c*100)/cantidad > 35 && (c*100)/cantidad < 75 ) 
          puts "Se pueden crear grupos"
        else
          puts "No se pueden crear grupos"  
        end
      else 
        if ((d*100)/cantidad > 35 && (d*100)/cantidad < 75 ) 
          puts "Se pueden crear grupos"
        else
          puts "No se pueden crear grupos"  
        end
    end
=end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:objetivo, :fecha)
    end
end
