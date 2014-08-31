class CommentsController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
  end

  def create
    @comment = Comment.new(content: params[:comment][:content],
                           user_id: session[:user_id],
                           commentable_id: params[:question_id],
                           commentable_type: "Question")
    if @comment.save
      user = User.find(session[:user_id])
      user.comments << @comment
      question = Question.find(params[:question_id])
      question.comments << @comment
      redirect_to question_path(question.id)
    else
      render 'new'
    end

  end
end
