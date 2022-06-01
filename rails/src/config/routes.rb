# frozen_string_literal: true

Rails.application.routes.draw do
  get :hc, to: 'healthcheck#index'
  root to: 'healthcheck#index'

  ##SHRINE##
end
