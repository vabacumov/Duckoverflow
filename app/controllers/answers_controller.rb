class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(question_id: params[:question_id], user_id: session[:user_id], content: params[:answer][:content])
    p @answer
    if @answer.save
      redirect_to @answer.question
    else
      redirect_to "/questions/#{params[:question_id]}/answers/new"
    end
  end

end
