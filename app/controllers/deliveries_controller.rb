class DeliveriesController < ApplicationController
  before_action :set_delivery, only: %i[ show update destroy ]

  # GET /deliveries
  def index
    # @deliveries = Delivery.all
    #@deliveries = Delivery.where(nil)
    # binding.pry
    @deliveries = Delivery.joins(:product).where(payload_name: 1)#@deliveries.products.by_payload_name(params[:payload_name]) if params[:payload_name].present?
    # filtering_params(params).each do |key, value|
    #   @deliveries = @deliveries.public_send("by_#{key}", value) if value.present?
    # end
    
    binding.pry
    
    render json: @deliveries
  end

  # GET /deliveries/1
  def show
    render json: { truck_name: @delivery.truck.name, payload_name: @delivery.product.payload_name, payload_size: @delivery.product.payload_size, total_billing: @delivery.product.total_billing, from: @delivery.product.from, to: @delivery.product.to, date: @delivery.product.created_at }
  end

  # POST /deliveries
  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      render json: @delivery, status: :created, location: @delivery
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deliveries/1
  def update
    if @delivery.update(delivery_params)
      render json: @delivery
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deliveries/1
  def destroy
    @delivery.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def delivery_params
      params.require(:delivery).permit(:truck_id, :product_id)
    end

    def filtering_params(params)
      params.slice(:date, :payload_name, :payload_size, :total_billing, :from, :to)
    end
end
