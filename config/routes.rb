# frozen_string_literal: true

Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest
  # priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'landing_page#index', as: :root

  defaults format: :html do
    resources :landing_page, only: [:index], via: [:get]
    resources :contact, only: [:index], via: [:get], as: :contact

    scope 'career' do
      get '/cv' => 'career#resume', as: :resume
    end

    scope '/open-source' do
      resources :projects, only: %i[index show], via: [:get]
      resources :career, only: [:resume], via: [:get]
      # get '/' => 'projects#open_source_index', :as => :open_source_index
      # # The show method uses pretty URLs generated by friendly_id
      # get '/:id' => 'projects#open_source_show', :as => :open_source_project
    end

    scope '/hobbies' do
      get '/music', to: 'hobbies#music', as: :hobbies_music
    end

    get '/licenses', to: 'legal#terms', as: :licenses
    get '/privacy-policy', to: 'legal#privacy_policy', as: :privacy_policy
  end

  # Require json for the API
  constraints subdomain: 'api' do
    get '/info/contact', to: 'info#contact', as: :contact_info
    namespace :api, path: nil, defaults: { format: :json } do
      resources :info, only: [:contact], via: [:get]
    end
  end

  # namespace :api, path: nil, defaults: { format: :json }, constraints: lambda
  # { |req| req.format == :json } do

  #   scope '/docs' do
  #     get "/", to: 'documentation#index', via: [:get]
  #   end
  #   get '/cv' => 'career#resume', only: [:resume], via: [:get], as: :cv
  #   get '/projects' => 'projects#index', only: [:index, :show], via: [:get],
  #     as: :projects
  # end
end
