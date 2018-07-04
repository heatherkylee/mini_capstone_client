class Client::ProductsController < ApplicationController
  def index 
    # unirest request here
    response = Unirest.get("http://localhost:3000/api/products")
    @products = response.body
    render "index.html.erb"
  end

  def show
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    response = Unirest.post("http://localhost:3000/api/products", parameters:
      {
        input_name: params[:input_name],
        input_price: params[:input_price],
        input_description: params[:input_description],
        input_image: params[:input_image]
      }
    )
    @product = response.body
    render "show.html.erb"
  end
  def edit
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render "edit.html.erb"
  end
  def update
    client_update_params = {
      input_name: params[:input_name],
      input_price: params[:input_price],
      input_description: params[:input_description],
      input_image: params[:input_image]
    }
    product_id = params[:id]
    response = Unirest.patch("http://localhost:3000/api/products/#{product_id}", parameters: client_update_params)
    @product = response.body
    render "show.html.erb"
  end
end
