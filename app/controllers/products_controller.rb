class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    product
    quantity = product.quantity
    @selected = quantity.split(" ")
  end

  def create
    if params[:product][:image].present?
      uploaded_io = params[:product][:image]

      File.open(Rails.root.join('app', 'assets/images/uploads/product_images', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      params[:product][:image] = "uploads/product_images/#{uploaded_io.original_filename}"
    end

    params[:product][:quantity] = "#{params[:product][:quantity]} #{params[:product][:type]}"

    @product = Product.new(product_params)
    
    if @product.save
      redirect_to products_url
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update

    if params[:product][:quantity].present?
      params[:product][:quantity] = "#{params[:product][:quantity]} #{params[:product][:type]}"
    end

    if params[:product][:image].present?
      uploaded_io = params[:product][:image]

      File.open(Rails.root.join('app', 'assets/images/uploads/product_images', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      params[:product][:image] = "uploads/product_images/#{uploaded_io.original_filename}"
    end

    if product.update(product_params)
      redirect_to products_url(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    product.destroy
    
    redirect_to products_url
  end

  def product_list
    @products = Product.all
  end

  private
  
    def product
      @product = Product.find(params[:id])
    end
    
    def product_params
      params.require(:product).permit(:name, :price, :sku, :is_seasonal, :image, :quantity, :category)
    end

end