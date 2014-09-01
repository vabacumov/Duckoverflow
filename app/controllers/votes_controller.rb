class VotesController < ApplicationController
  def up_question_vote
    previous_vote = current_user_vote("Question", session[:question_id])
    if previous_vote == nil
      @vote = Vote.create(upvote: true, user_id: session[:user_id], voteable_id: session[:question_id], voteable_type: "Question")
      redirect_to "/questions/#{session[:question_id]}"
    else
      new_vote = Vote.find(previous_vote.id)
      new_vote.upvote = true
      new_vote.save
      redirect_to "/questions/#{session[:question_id]}"
    end
  end

  def down_question_vote
    previous_vote = current_user_vote("Question", session[:question_id])
    if previous_vote == nil
      @vote = Vote.create(upvote: false, user_id: session[:user_id], voteable_id: session[:question_id], voteable_type: "Question")
      redirect_to "/questions/#{session[:question_id]}"
    else
      new_vote = Vote.find(previous_vote.id)
      new_vote.upvote = false
      new_vote.save
      redirect_to "/questions/#{session[:question_id]}"
    end
  end

  def up_answer_vote
    previous_vote = current_user_vote("Answer", params[:answer_id])
    if previous_vote == nil
      @vote = Vote.create(upvote: true, user_id: session[:user_id], voteable_type: "Answer", voteable_id: params[:answer_id])
      redirect_to "/questions/#{session[:question_id]}"
    else
      new_vote = Vote.find(previous_vote.id)
      new_vote.upvote = true
      new_vote.save
      redirect_to "/questions/#{session[:question_id]}"
    end
  end

  def down_answer_vote
    previous_vote = current_user_vote("Answer", params[:answer_id])
    if previous_vote == nil
      @vote = Vote.create(upvote: false, user_id: session[:user_id], voteable_type: "Answer", voteable_id: params[:answer_id])
      redirect_to "/questions/#{session[:question_id]}"
    else
      new_vote = Vote.find(previous_vote.id)
      new_vote.upvote = false
      new_vote.save
      redirect_to "/questions/#{session[:question_id]}"
    end
  end

  private
  def current_user_vote(voteable_type, voteable_id)
    if voteable_type == 'Question'
      user_votes = User.find(session[:user_id]).votes
      previous_vote = user_votes.where(votes: {voteable_type: "Question", voteable_id: voteable_id}).first
    else
      user_votes = User.find(session[:user_id]).votes
      previous_vote = user_votes.where(votes: {voteable_type: "Answer", voteable_id: voteable_id}).first
    end
  end
end
