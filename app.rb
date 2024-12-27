require "sinatra"
require "sinatra/reloader"
require "http"


get("/") do

  @raw_repsonse = HTTP.get("https://api.exchangerate.host/list?access_key=EXCHANGE_RATE_KEY")
  
  @string_response = @raw_response.to_s

  @parsed_response = JSON.parse@string_response

  @currencies = @parsed_response.fetch("currencies")

  erb(:homepage)

end
