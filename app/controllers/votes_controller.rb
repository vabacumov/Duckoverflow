class VotesController < ApplicationController
  def upvote
    p session[:question_id]
    @vote = Vote.create(upvote: true, user_id: session[:user_id], voteable_id: session[:question_id], voteable_type: "question")
    redirect_to "/questions/#{session[:question_id]}"
  end

  def downvote
    p session[:question_id]
    @vote = Vote.create(upvote: false, user_id: session[:user_id], voteable_id: session[:question_id], voteable_type: "question")
    redirect_to "/questions/#{session[:question_id]}"
  end
end
