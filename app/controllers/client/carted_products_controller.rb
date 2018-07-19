class Client::CartedProductsController < ApplicationController
  # make new
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
    carted_product = response.body
    p carted.product
    redirect_to "/client/carted_products/#{}"
  end

end

  def create
    response = Unirest.post("http://localhost:3000/api/orders", parameters: {
      product_id: params[:product_id],
      quantity: params[:quantity]
      }
    )
    order = response.body
    p order
    redirect_to "/client/orders/#{order['order_id']}"
  end