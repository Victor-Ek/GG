#Use bundler to load gems
require 'bundler'

#Load gems from Gemfile
Bundler.require

#Load the app
require_relative 'main.rb'

#Load models
require_relative 'models/create'

#Make Slim NICE!
Slim::Engine.set_options pretty: true, sort_attrs: false

#Run the app
run Main
