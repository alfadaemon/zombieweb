class API::V1::ResponsesController < ApplicationController
  protect_from_forgery except: :create

  def index
    @response = Response.all
    render :status => 200, :json => @response.to_json
  end

  def create
    @response = Response.create(user_id: params['user_id'], answer_id: params['answer_id'])
    render :status => 200, :json => @response.to_json({:only => [:user_id, :answer_id] })
  end

end