class AffiliatesController < ApplicationController
  def index
    @affiliate = Affiliate.new
  end

  def show
    @affiliate = Affiliate.keyword_info(params)
  end

  def create
    @affiliate = Affiliate.create(affiliate_params)
    if @affiliate.save
      redirect_to affiliate_path(@affiliate)
    end
  end

  private
  def affiliate_params
    params.require(:affiliate).permit(:keyword)
  end
end