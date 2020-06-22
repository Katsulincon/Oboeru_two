Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :folders, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :paragraphs, only: [:create, :show, :edit, :update] do
      resources :blanks, only: [:new, :create, :edit, :update]
    end
  end

  delete "folders/:folder_id/paragraphs/:id", to: "paragraphs#destroy", as: :destroy_paragraph
  delete "folders/:folder_id", to: "folders#destroy", as: :destroy_folder
end
