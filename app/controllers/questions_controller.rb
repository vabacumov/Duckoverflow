class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question =  Question.new
  end
  #show is serving as the new controller for now
  def show
    # @question =  Question.new
    @question =  Question.find(params[:id])
  end


  def create
    @question =  Question.new(title: params[:title], content: params[:content])
    user = User.find(session[:user_id])
    @question.user = user
    if @question.save
      # flash[:success] = "Welcome to the Sample App!"
      redirect_to @question
    else
      render 'new'
    end
  end

end

