# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/:id', to: 'users/registrations#show', as: 'profile'
    authenticated :user do
      root 'public#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'public/index'
  resources :questions do
    resources :answers
  end

  resources :questions, only: [] do
    member do
      post :upvote, to: 'votes#upvote', type: 'Question'
      post :downvote, to: 'votes#downvote', type: 'Question'
      post :upvote_inc_downvote_dec, to: 'votes#upvote_inc_downvote_dec', type: 'Question'
      post :upvote_dec_downvote_inc, to: 'votes#upvote_dec_downvote_inc', type: 'Question'
    end
  end

  resources :answers, only: [] do
    member do
      post :upvote, to: 'votes#upvote', type: 'Answer'
      post :downvote, to: 'votes#downvote', type: 'Answer'
      post :upvote_inc_downvote_dec, to: 'votes#upvote_inc_downvote_dec', type: 'Answer'
      post :upvote_dec_downvote_inc, to: 'votes#upvote_dec_downvote_inc', type: 'Answer'
    end
  end
end
