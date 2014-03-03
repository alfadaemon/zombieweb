class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    if session[:question_id]
      @answer = Answer.new
      @answer.question_id = session[:question_id]
    else
      flash[:notice] = 'Agregue una pregunta primero'
      redirect_to new_question_path, notice: 'Es necesario crear una pregunta primero.'
    end
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|

      if @answer.question.answers.count < 3

        if @answer.save
          format.html { redirect_to new_answer_path }#redirect_to @answer, notice: 'Answer was successfully created.' }
          format.json { render action: 'new' }#, status: :created, location: @answer }
        else
          format.html { render action: 'new' }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      else
        flash[:notice] = 'Error'
        format.html { redirect_to new_answer_path, notice: 'Solamente se permite agregar 3 respuestas.' }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:question_id, :answer, :correct)
    end
end
