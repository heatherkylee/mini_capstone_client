class Client::ProductsController < ApplicationController
  def index 
    # unirest request here
    user_input = params[:client_search]
    response = Unirest.get("http://localhost:3000/api/products",
      parameters: {
        api_search: user_input,
        category: params[:category]
      }
    )
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
    @product1 = {}
    render "new.html.erb"
  end

  def create
    @product1 = {
        input_name: params[:input_name],
        input_price: params[:input_price],
        input_description: params[:input_description],
        input_image: params[:input_image],
        supplier_id: params[:supplier_id]
      }
    response = Unirest.post("http://localhost:3000/api/products", parameters:
      @product1
    )
    @product = response.body

    if response.code == 200
      flash[:complete] = "New product has been added."
      redirect_to "/client/products/#{@product['id']}"
    else
      @errors = response.body['errors']
      render 'new.html.erb'
    end
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
      input_image: params[:input_image],
      supplier_id: params[:supplier_id]
    }
    product_id = params[:id]
    p product_id
    response = Unirest.patch("http://localhost:3000/api/products/#{product_id}", parameters: client_update_params)
    p @product = response.body
    flash[:complete] = "Product has been updated."
    redirect_to "/client/products/#{@product['id']}"
  end

  def destroy
    product_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/products/#{product_id}")
    flash[:remove] = "Product has been removed."
    redirect_to "/client/products"
  end
end
