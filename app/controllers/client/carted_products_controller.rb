class Client::CartedProductsController < ApplicationController
  # make new
  def index
    @carted_products = Unirest.get("http://localhost:3000/api/carted_products").body 
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
    render "show.html.erb"
  end

end
