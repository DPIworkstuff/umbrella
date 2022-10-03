p "Where are you located?"
user_location = gets.chomp
# user_location = "200 S wacker"

p user_location

require "open-uri"


gmaps_api_url = "https://maps.googleapis.com/maps/api/geocode/json?address= #{user_location} &key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"

p gmaps_api_url

raw_gmaps_data = URI.open(gmaps_api_url).read
require "json"

parsed_gmaps_data= JSON.parse(raw_gmaps_data)

results_array = parsed_gmaps_data.fetch("results")
first_result= results_array.at(0)
geo= first_result.fetch("geometry")

loc =geo.fetch("location")

p latitude = loc.fetch("lat")
p longitude = loc.fetch("lng")

loc_for_dark_sky="#{latitude},#{longitude}"
dark_sky_api_url= "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/#{loc_for_dark_sky}"


raw_darksky_data = URI.open(dark_sky_api_url).read

parsed_darksky_data= JSON.parse(raw_darksky_data)

dark_sky_result = parsed_darksky_data.fetch("currently")

temperature= dark_sky_result.fetch("temperature")

p temperature
