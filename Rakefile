require_relative './config/environment'
# set :database_file, "./config/database.yml"
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

desc 'Enter a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end
