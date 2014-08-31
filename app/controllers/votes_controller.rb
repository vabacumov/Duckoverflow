class VotesController < ApplicationController
  def up_question_vote
    @vote = Vote.create(upvote: true, user_id: session[:user_id], voteable_id: session[:question_id], voteable_type: "Question")
    redirect_to "/questions/#{session[:question_id]}"
  end

  def down_question_vote
    @vote = Vote.create(upvote: false, user_id: session[:user_id], voteable_id: session[:question_id], voteable_type: "Question")
    redirect_to "/questions/#{session[:question_id]}"
  end

  def up_answer_vote
    @vote = Vote.create(upvote: true, user_id: session[:user_id], voteable_type: "Answer", voteable_id: params[:answer_id])
    redirect_to "/questions/#{session[:question_id]}"
  end

  def down_answer_vote
    @vote = Vote.create(upvote: false, user_id: session[:user_id], voteable_type: "Answer", voteable_id: params[:answer_id])
    redirect_to "/questions/#{session[:question_id]}"
  end
end
