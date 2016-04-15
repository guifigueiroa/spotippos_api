require 'spec_helper.rb'

describe 'API methods' do
  let(:accepts_json) { {'Content-Type' => 'application/json'} }
  let(:data){ { "x" => 222, "y" => 444, "beds" => 4, "baths" => 3, "squareMeters" => 210 }.to_json }
  
  it 'performs POST request for adding property' do
    post '/properties', data, accepts_json
    
    hash = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.content_type).to eq accepts_json["Content-Type"]
    
    expect(hash["id"]).not_to be_nil
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

    hash = JSON.parse(last_response.body)
    
    expect(last_response).to be_ok

    expect(hash["id"]).to eq 1
    expect(hash["x"]).to eq 88
    expect(hash["y"]).to eq 521
    expect(hash["beds"]).to eq 5
    expect(hash["baths"]).to eq 4
    expect(hash["provinces"]).to eq ["Gode"]
    expect(hash["squareMeters"]).to eq 198
  end
  
  it 'presents error when GET request has invalid params' do
    get '/properties/text'
    
    expect(last_response).to be_client_error
    
    get '/properties/'
    
    expect(last_response).to be_client_error
  end
  
  it 'performs GET request for query properties within range' do
    get '/properties?ax=0&ay=50&bx=15&by=0'

    hash = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    
    expect(hash).to eq({ "foundProperties" => 1, 
                                  "properties" => [
                                    { "id" => 3142, 
                                      "x" => 8, 
                                      "y" => 44, 
                                      "beds" => 5, 
                                      "baths" => 4, 
                                      "provinces" => [ "Scavy" ], 
                                      "squareMeters" => 236}
                                    ]})
  end
end