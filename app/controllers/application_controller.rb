# require 'sinatra/base'
#  require '../helpers/application_helpers'

class ApplicationController < Sinatra::Base 
    register Sinatra::CrossOrigin
    # set :views, 'app/views'
    # enable :sessions
    enable :cross_origin

    options '*' do
        headers['Access-Control-Allow-Origin'] = "*"
        headers['Access-Control-Allow-Methods'] = "GET,POST,PUT,DELETE,OPTIONS"
    end

    get '/' do 
        content_type :json
        {'status' => 'success', 'books' => Book.all}.to_json
    end  

    post '/' do
        # request.body.rewind
    # request_payload = JSON.parse request.body.read

        post_data = JSON.parse(request.body.read.to_s)
        # puts "I got some JSON: #{post_data.inspect}"
        Book.create({
            title: post_data['title'], 
            author: post_data['author'], 
            read: post_data['read']
        })
        # response_object['message'] = 'Book Added!'
        content_type :json
        {'message' => 'Book Added!'}.to_json
    end

    put "/book/:title" do
        put_data = JSON.parse(request.body.read.to_s)
        Book.where(title: params[:title].to_s).update(
            title: put_data['title'], 
            author: put_data['author'], 
            read: put_data['read']
        )
        content_type :json
        {'message' => 'Book Updated!'}.to_json
    end

    delete "/book/:title" do
        # delete_data = JSON.parse(request.body.read.to_s)
        deleteBook = Book.find_by(title: params[:title].to_s)
        Book.delete(deleteBook.id)
        content_type :json
        {'message' => 'Book Deleted!'}.to_json
    end
end
    





#  Book.where(id: 10).update(title: "mom", author: "son", read: true)