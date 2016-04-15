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
  property = ctrl.create(data)
  
  halt 422 if property.nil?
  
  return property.to_json
end

get "/properties/:id" do |id|
  # checks if string is valid integer, halts if not
  halt 400 unless id.to_i.to_s == id
  
  ctrl.show(id.to_i).to_json
end

get "/properties" do
  ax = params['ax']
  ay = params['ay']
  bx = params['bx']
  by = params['by']
  
  # checks if request is valid
  if ax && ay && bx && by
    ctrl.query(ax.to_i, ay.to_i, bx.to_i, by.to_i).to_json
  else
    # invalid params
    halt 400
  end
end