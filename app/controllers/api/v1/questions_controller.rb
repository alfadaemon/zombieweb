class API::V1::QuestionsController < ApplicationController

  def index
    @question = Question.find(:all, :select => 'id, question, level_id, category_id')
    render :status => 200, :json => @question.to_json(:include => 
    	{:answers => {:only => [:id, :answer] } } )
  end

end