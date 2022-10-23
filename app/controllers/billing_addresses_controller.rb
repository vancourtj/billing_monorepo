class BillingAddressesController < ApplicationController
  def index
    @billing_addresses = BillingAddress.order(created_at: :desc)
  end

  def new
    @billing_address = BillingAddress.new
  end

  def create
    @billing_address = BillingAddress.new(billing_address_params)
    
    if @billing_address.save
      redirect_to '/billing_addresses/success'
    else
      # render json: ErrorSerializer.serialize(@billing_address.errors.messages).to_json, status: :unprocessable_entity
      render :new, status: :unprocessable_entity
    end
  end

  def success
  end

  private

  def billing_address_params
    params.require(:billing_address).permit(:name, :email_address, :phone_number, :street_address, :city, :state, :zip)
  end
end
