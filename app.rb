# file that is the main root of the site
# this is used for everything from displaying routes, to redirecting, get/post requests, etc. 

# in local, cd into folder, run `ruby app.rb`, and see the app on http://localhost:4567/

# the require 'bundler/setup' before the other gems is because of this http://stackoverflow.com/questions/11110148/rack-sinatra-loaderror-cannot-load-such-file

require 'bundler/setup'
require 'sinatra'

# Use active record if I want rails functionality
#require 'sinatra/activerecord'

# Use enviornments for db
#require './environments'

# Pony for easy mail delivery (similar to php.mail() function)
require 'pony'


get "/" do 
  erb :"welcome/index"
end

get "/restaurant" do 
	erb :"theme-pages/restaurant"
end

get "/pro-single" do 
	erb :"theme-pages/pro-single"
end

get "/skrollr" do 
	erb :"theme-pages/skrollr"
end

get '/javascripts/:main.js' do |script|
  javascript :"javascripts/#{script}"
end

get '/stylesheets/:styles.css' do |stylesheet|
  css :"stylesheets/#{stylesheet}"
end