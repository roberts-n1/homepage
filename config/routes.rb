# frozen_string_literal: true

Rails.application.routes.draw do
  scope ':locale', locale: /#{I18n.available_locales.join('|')}/ do
    resources :pages
    root to: 'pages#index'
  end

  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), via: %i[get post] # rubocop:disable Style/FormatStringToken
  match '', to: redirect("/#{I18n.default_locale}"), via: %i[get post]
end
