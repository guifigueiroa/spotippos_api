require 'spec_helper.rb'

describe 'API methods' do
  let(:accepts_json) { {'Content-Type' => 'application/json'} }
  let(:data){ { "x" => 222, "y" => 444, "beds" => 4, "baths" => 3, "squareMeters" => 210 }.to_json }
  
  it 'performs POST request for adding property' do
    post '/properties', data, accepts_json
    
    json = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.content_type).to eq accepts_json["Content-Type"]
    
    expect(json["id"]).not_to be_nil
  end
  
  it 'presents error when POST request has invalid beds data' do
    invalid_data = { "x" => 222, "y" => 444, 
      "beds" => 10, "baths" => 3, "squareMeters" => 210 }.to_json
    post '/properties', invalid_data, accepts_json
    
    expect(last_response).to be_client_error
    
    invalid_data = { "x" => 222, "y" => 444, 
      "baths" => 3, "squareMeters" => 210 }.to_json
    post '/properties', invalid_data, accepts_json
    
    expect(last_response).to be_client_error
  end
  
  it 'presents error when POST request has invalid baths data' do
    invalid_data = { "x" => 222, "y" => 444, 
      "beds" => 4, "baths" => 5, "squareMeters" => 210 }.to_json
    post '/properties', invalid_data, accepts_json
    
    expect(last_response).to be_client_error
    
    invalid_data = { "x" => 222, "y" => 444, 
      "beds" => 4, "squareMeters" => 210 }.to_json
    post '/properties', invalid_data, accepts_json
    
    expect(last_response).to be_client_error
  end
  
  it 'presents error when POST request has invalid square meters data' do
    invalid_data = { "x" => 222, "y" => 444, 
      "beds" => 4, "baths" => 3, "squareMeters" => 250 }.to_json
    post '/properties', invalid_data, accepts_json
    
    expect(last_response).to be_client_error
    
    invalid_data = { "x" => 222, "y" => 444, 
      "beds" => 4, "baths" => 3 }.to_json
    post '/properties', invalid_data, accepts_json
    
    expect(last_response).to be_client_error
  end
  
  it 'performs GET request for specific property' do
    get '/properties/1'

    json = JSON.parse(last_response.body)
    
    expect(last_response).to be_ok

    expect(json["id"]).to eq 1
    expect(json["x"]).to eq 88
    expect(json["y"]).to eq 521
    expect(json["beds"]).to eq 5
    expect(json["baths"]).to eq 4
    expect(json["squareMeters"]).to eq 198
  end
end