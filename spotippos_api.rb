require 'sinatra'
require 'json'
require_relative 'controllers/properties_controller'

set :bind, '0.0.0.0'
before do
  content_type 'application/json'
end

configure do
  set :controller, PropertiesController.new
end

def ctrl
  settings.controller
end

post "/properties" do
  request.body.rewind  # in case someone already read it
  data = JSON.parse request.body.read
  ctrl.create(data).to_json
end

get "/properties/:id" do |id|
  ctrl.show(id.to_i).to_json
end