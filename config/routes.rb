# frozen_string_literal: true

Rails.application.routes.draw do
  resources :postcodes

  root to: 'postcodes#index'
end
