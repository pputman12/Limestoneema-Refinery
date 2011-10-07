::Refinery::Application.routes.draw do
  resources :hazards, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :hazards, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
