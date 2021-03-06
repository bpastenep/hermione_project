class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @proposito = Purpose.all 
    pp @proposito
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.purpose_id = params[:proposito]
    pp params[:proposito]
    respond_to do |format|
      if @question.save
        pp "entre al save"
        format.html { redirect_to @question, notice: 'Pregunta fue exitosamente creada' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Pregunta fue exitosamente actualizada' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Pregunta fue eliminada' }
      format.json { head :no_content }
    end
  end

  def quiz
    @idPregunta = params[:id]
    puts "entre a quiz"
  end

  def searchQuestionsActive
    active = EvaluationQuestion.where(logrado: true)
    puts active
    if active.nil?
      @resultado = nil
      puts "No existen preguntas activas"
    else
      respuestas = Array.new(4)
      @respuestasD = Array.new(4)
      tmp = Tmp.last
      active.each do |pregunta|
        idPregunta = pregunta.question_id
        @resultado = Question.find(idPregunta)
        if @resultado.nil?
          puts "no encontré preguntas con ese id"
        else
        puts "BBBBBBBBBBBBBBB #{@resultado}"
      end 
      respuestas[0]=@resultado.respuesta
      tmp.correctAlternative = @resultado.respuesta
      respuestas[1]=@resultado.respuestas_incor
      respuestas[2]=@resultado.respuesta_incorrecta2
      respuestas[3]=@resultado.respuesta_incorrecta3
      if tmp.flagAlternativas
        puts "ENNNNTRE A QUE NO SE HAN GUARDADO LAS ALTERNATIVAS"
        @respuestasD = respuestas.shuffle
        puts @respuestasD[0]
        puts @respuestasD[1]
        puts @respuestasD[2]
        puts @respuestasD[3]
        tmp.update(a: @respuestasD[0], b: @respuestasD[1], c: @respuestasD[2], d: @respuestasD[3], flagAlternativas: false) 
      else
        @respuestasD[0]= tmp.a
        @respuestasD[1]= tmp.b
        @respuestasD[2]= tmp.c
        @respuestasD[3]= tmp.d
      end
    end
  end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:tipo_pregunta, :enunciado, :respuesta, :respuestas_incor, :respuesta_incorrecta2, :respuesta_incorrecta3, :imagen)
    end
end
