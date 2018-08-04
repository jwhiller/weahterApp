class WeatherControllerController < ApplicationController

  @states = %w(HI AK CA OR WA ID UT NV AZ NM CO WY MT ND SD NB KS OK TX LA AR MO IA MN WI IL IN MI OH KY TN MS AL GA FL SC NC VA WV DE MD PA NY NJ CT RI MA VT NH ME DC ).sort

  def index
# checks that the state and city params are not empty before calling the API
if params[:zipcode] != '' && !params[:zipcode].nil?
  response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=#{params[:zipcode]}
&units=imperial&appid=#{ENV['openweather_api_key']}")
  @status = response['cod']
  # if no error is returned from the call, we fill our instance variables with the result of the call
  if @status != '404' && response['message'] != 'city not found'
    @location = response['name']
    @temp = response['main']['temp']
    @weather_icon = response['weather'][0]['icon']
    @weather_words = response['weather'][0]['description']
    @cloudiness = response['clouds']['all']
    @windiness = response['wind']['speed']
  else
    # if there is an error, we report it to our user via the @error variable
    @error = response['message']
  end


if @weather_words.include? "clouds"
    @bgimage = "https://images.unsplash.com/photo-1501630834273-4b5604d2ee31?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8679c5f905a034df3296c6676fb84aa5&w=1000&q=80"
elsif @weather_words.include? "clear"
    @bgimage = "https://media.istockphoto.com/photos/clear-blue-sky-background-picture-id508544168?k=6&m=508544168&s=612x612&w=0&h=RyH8EQOHEQnn-WdJqjn3EpyW6a0ppCtW_iLHKSBXAlk="
elsif @weather_words.include? "rain"
    @bgimage = "https://images.unsplash.com/photo-1433863448220-78aaa064ff47?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=723ac0c6a3eb82eb16190fea1ad22755&w=1000&q=80"
elsif @weather_words.include? "snow"
    @bgimage = "http://johnwelchent.com/files/7013/9542/5054/snow.jpg"
elsif @weather_words == "fog"
    @bgimage = "https://upload.wikimedia.org/wikipedia/commons/c/ca/Dense_Seattle_Fog.jpg"
else
    @bgimage = "https://i.ytimg.com/vi/3EXe5cx5S-0/maxresdefault.jpg"
end
end
end



def test
response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=28204&units=imperial&appid=#{ENV['openweather_api_key']}")
@location = response['name']
@temp = response['main']['temp']
@weather_icon = response ['weather'][0]['icon']
@weather_words = response ['weather'][0]['description']
@cloudiness = response ['clouds']['all']
@windiness = response ['wind']['speed']
end






def result

end
end
