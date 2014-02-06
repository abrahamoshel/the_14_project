The14Project::Application.routes.draw do

  root to: 'static#index'

  get "about_us",   to: 'static#about_us'
  get "contact_us", to: 'static#contact_us'

end
