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
  
  halt 422, { msg: "Invalid data" }.to_json if property.nil?
  
  return property.to_json
end

get "/properties/:id" do |id|
  # checks if string is valid integer, halts if not
  halt(400, { msg: "Invalid id for property" }.to_json) unless id.to_i.to_s == id
  
  result = ctrl.show(id.to_i)
  
  if result
    return result.to_json
  else
    halt 404, { msg: "No property with specified id" }.to_json
  end
end

get "/properties" do
  ax = params['ax']
  ay = params['ay']
  bx = params['bx']
  by = params['by']
  
  # checks if request is valid
  if ax && ay && bx && by
    result = ctrl.query(ax.to_i, ay.to_i, bx.to_i, by.to_i)
    if result
      return result.to_json
    else
      halt 404, { msg: "No properties with specified parameters" }.to_json
    end
  else
    # invalid params
    halt 400, { msg: "Invalid parameters" }.to_json
  end
end

error Sinatra::NotFound do
  halt 404, { msg: "Not found URL. More details on how to use API can be found at https://github.com/guifigueiroa/spotippos_api" }.to_json
end