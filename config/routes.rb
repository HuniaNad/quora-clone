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
  resources :votes, only: [] do
    member do
      post 'upvote'
      post 'downvote'
      post 'upvote_inc_downvote_dec'
      post 'upvote_dec_downvote_inc'
    end
  end
end
