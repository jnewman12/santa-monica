# file that is the main root of the site
# this is used for everything from displaying routes, to redirecting, get/post requests, etc. 

# in development, see the app on http://localhost:4567/

# the require 'bundler/setup' before the other gems is because of this http://stackoverflow.com/questions/11110148/rack-sinatra-loaderror-cannot-load-such-file

require 'bundler/setup'
require 'sinatra'
#require 'sinatra/activerecord'
#require './environments'
require 'pony'


get "/" do 
  erb :"welcome/index"
end