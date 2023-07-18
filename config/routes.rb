Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get 'sobre', to: 'home#sobre'
  get '/contactos', to: 'contactos#index'

  get '/contactos/novo', to: 'contactos#create'
  post '/contactos/cadastrar', to: 'contactos#store'
  get '/contacto/:id/mostrar', to: 'contactos#show'
  get '/contacto/:id/editar', to: 'contactos#edit'
  put '/contacto/:id/actualizar', to: 'contactos#update'
  delete '/contacto/:id/apagar', to: 'contactos#delete'
end
