Rails.application.routes.draw do
  root :to => "welcome#index"

  get '/users/logout' => "users#logout"
  get '/users/login' => "users#login"
  post '/login_user' => "users#login_user"

  post '/up_question_votes' => "votes#up_question_vote", as: "Up_question_vote"
  post '/down_question_votes' => "votes#down_question_vote", as: "Down_question_vote"
  post '/answers/:answer_id/up_answer_votes' => "votes#up_answer_vote", as: "Up_answer_vote"
  post '/answers/:answer_id/down_answer_votes' => "votes#down_answer_vote", as: "Down_answer_vote"


  resources :users, shallow: true do
    resources :questions
    resources :answers
    resources :comments
  end

  resources :questions, shallow: true do
    resources :answers
    resources :comments
  end

  resources :answers, shallow: true do
    resources :comments
  end
end
