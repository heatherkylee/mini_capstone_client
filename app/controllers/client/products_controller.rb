class Client::ProductsController < ApplicationController
  def index 
    # unirest request here
    response = Unirest.get("http://localhost:3000/api/products")
    @products = response.body
    render "index.html.erb"
  end
end
