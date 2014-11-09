Apartamesa::Application.routes.draw do
  get 'restaurantes', to: 'restaurants#home'
  get 'panel', to: 'restaurants#panel'
  get 'admin', to: 'home#admin'

  root to: 'home#index'

  devise_for  :users,
              path: '',
              path_names: { sign_in: 'login',
                            sign_out: 'logout',
                            sign_up: 'register' },
              controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  scope 'restaurantes' do
    devise_for  :restaurants,
                path: '',
                path_names: { sign_in: 'login',
                              sign_out: 'logout',
                              sign_up: 'register' }
  end
end
