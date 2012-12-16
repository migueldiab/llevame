Llevame::Application.routes.draw do
  resources :auxilios


  root :to => 'main#home'

  get "registrar" => 'main#registrar'
  get "llevame" => 'main#llevame'

  get "signIn" => 'session#new'
  get "signOut" => 'session#destroy'
  post "newUser" => 'users#newUser'
  post "loginUser" => 'session#loginUser'
  get "loginFromCookies" => 'session#loginFromCookies'

  get "main/about"

  match ':controller(/:action(/:id(.:format)))'
end
