Rails.application.routes.draw do
  
  namespace 'api' do   
    namespace 'v1' do    
    resources :bici_usuarios
    end
  end
  post 'user_token' => 'user_token#create'
  resources :bici_usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
