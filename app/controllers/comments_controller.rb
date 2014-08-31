class CommentsController < ApplicationController
  def new
    if params[:question_id]
      @question = Question.find(params[:question_id])
    elsif params[:answer_id]
      @answer = Answer.find(params[:answer_id])
    end
  end

  def create
    commentable_id = params[:question_id] ||= params[:answer_id]
    if params[:answer_id]
      commentable_type = "Answer"
    else
      commentable_type = "Question"
    end
    @comment = Comment.new(content: params[:comment][:content],
                           user_id: session[:user_id],
                           commentable_id: commentable_id,
                           commentable_type: commentable_type)
    if @comment.save
      user = User.find(session[:user_id])
      user.comments << @comment
      if @comment.commentable_type == "Question"
        question = Question.find(params[:question_id])
        question.comments << @comment
        redirect_to question_path(question.id)
      elsif @comment.commentable_type == "Answer"
        answer = Answer.find(params[:answer_id])
        answer.comments << @comment
        redirect_to question_path(answer.question.id)
      end
    else
      render 'new'
    end
  end
end
