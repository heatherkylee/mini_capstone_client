class Client::OrdersController < ApplicationController
  #make show action
  def show
    order_id = params[:id]
    response = Unirest.get("localhost:3000/api/orders/#{order_id}")
    @order = response.body
    render "show.html.erb"
  end
  #make new action - this was removed to make the app more user friendly
  # def new
  #   render "new.html.erb"
  # end
  #make create action
  def create
    response = Unirest.post("http://localhost:3000/api/orders")
    order = response.body
    redirect_to "/client/orders/#{order['order_id']}"
  end
end
