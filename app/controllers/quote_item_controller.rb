class QuoteItemController < ApplicationController

  def index
    
  end

  def approve
    quote = Quote.find(params[:q])
    QuoteItem.find_by(id: params[:qi]).update(status: "Approved")
    # @approve_net_prem = QuoteItem.where(status: "Approved").sum(:net_prem)
   
    flash[:success] = "Item was approved."
    redirect_back fallback_location: quote#, notice: "Item was approved."
  end

  def deny
    quote = Quote.find(params[:q])
    QuoteItem.find_by(id: params[:qi]).update(status: "Denied")
    flash[:danger] = "Item was denied"
    redirect_back fallback_location: quote#,  flash[:alert] = "Item was denied."
  end

end