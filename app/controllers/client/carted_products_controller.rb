class Client::CartedProductsController < ApplicationController
  # make new
  def index
    response = Unirest.get("http://localhost:3000/api/carted_products")
    @carted_products = response.body
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    response = Unirest.post("http://localhost:3000/api/carted_products", parameters:
      {
        product_id: params[:product_id],
        quantity: params[:quantity]
      }
    )
    @carted_product = response.body
    redirect_to "/client/carted_products"
  end

end
