class ChargesController < ApplicationController
  before_action :set_item

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      amount: (@item.price*100).to_i,
      :description => 'Rails Stripe Customer',
      :currency => 'aud'
    )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to :back
  end

  private
  def set_item
    @item = Book.find(params[:book_id])
  end


end
