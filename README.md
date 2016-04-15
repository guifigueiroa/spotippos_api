# Spotippos API

API created as part of a [code challenge](https://github.com/VivaReal/code-challenge) using Ruby and Sinatra web framework, tested with RSpec and Rack:Test for HTTP requests.

API deployed to <http://spotippos-api.herokuapp.com/> ready to use.

## Usage

### 1. Create properties

Request:
```
POST /properties
```

Body:
```json
{
  "x": 222,
  "y": 444,
  "beds": 4,
  "baths": 3,
  "squareMeters": 210
}
```

Response:
```json
{
  "id": 4001,
  "x": 222,
  "y": 444,
  "beds": 4,
  "baths": 3,
  "provinces" : ["Ruja"],
  "squareMeters": 210
}
```

### 2. Search for properties by `id`

Request:
```
  GET /properties/{id}
```

Response:
```json
{
  "id": 665,
  "x": 667,
  "y": 556,
  "beds": 1,
  "baths": 1,
  "provinces" : ["Ruja"],
  "squareMeters": 42
}
```

### 3. Search for property within a rectangle

From a rectangle represented by the points A and B, where A is the upper left point and B is the bottom right point.

Each point is represented by the coordinates `x` and `y`. The point A is represented by `ax` and `ay` and B by `bx` e `by`.

Request:
```
  GET /properties?ax={integer}&ay={integer}&bx={integer}&by={integer}
```

Response:
```json
{
  "foundProperties": 3,
  "properties": [
    {
      "id": 34,
      "x": 999,
      "y": 333,
      "beds": 4,
      "baths": 3,
      "squareMeters": 237
    },
    {"..."},
    {"..."}
  ]
}
```

## How to run locally

Make sure Ruby is installed on your system. On the command line write and run command below:

  `ruby -v`
  
You will know whether it's installed or not if you see its version number!

If you don't have Sinatra gem installed, run following command:

  `gem install sinatra`

Then clone the git repository for your computer/server using:

  `git clone https://github.com/guifigueiroa/spotippos_api.git`
  
Enter the directory where you cloned the application and install all dependencies running:

  `bundle install`
  
Then run your application:

  `ruby spotippos_api.rb`
  
By default your API will be accessible at `http://localhost:4567/`
