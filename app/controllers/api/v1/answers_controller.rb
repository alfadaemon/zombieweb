class API::V1::AnswersController < ApplicationController

  def index
    @answer = Answer.all
    render :status => 200, :json => @answer
  end

  def show
    @answer = Answer.find(params[:id])
    render :status =>200, :json => @answer.to_json(:only => [:id, :answer, :question_id, :correct])
  end

end