class AffiliatesController < ApplicationController
  def index
    @affiliate = Affiliate.new
  end

  def show
  end

  def create
    @affiliate = Affiliate.new(affiliate_params)
    @affiliate.save
      redirect_to affiliates_path
  end

  private
  def affiliate_params
    params.require(:affiliate).permit(:keyword)
  end
end