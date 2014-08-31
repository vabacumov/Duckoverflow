class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  #show is serving as the new controller for now
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @comments = @question.comments
  end

  def create
    @question = Question.new(question_params)
    user = User.find(session[:user_id])
    @question.user = user
    if @question.save
      # flash[:success] = "Welcome to the Sample App!"
      redirect_to @question
    else
      render 'new'
    end
  end


  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end

