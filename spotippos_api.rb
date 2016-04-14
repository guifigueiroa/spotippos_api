require 'sinatra'
require 'json'

set :bind, '0.0.0.0'
before do
  content_type 'application/json'
end

class SpotipposAPI < Sinatra::Application
  
  def initialize
    @properties_controller = PropertiesController.new
  end
  
  
  post "/properties" do
    request.body.rewind  # in case someone already read it
    data = JSON.parse request.body.read
    @properties_controller.create(data).to_json
  end
end