class AffiliatesController < ApplicationController
  def index
    @affiliate = Affiliate.new
  end

  def show
    affiliate_keyword = Affiliate.find(params[:id]).keyword
    driver = Selenium::WebDriver.for :chrome

    driver.navigate.to "https://www.google.co.jp/"
    inputElement = driver.find_element(:name, 'q')
    inputElement.send_keys affiliate_keyword
    inputElement.submit

    search = driver.find_element(:css, "div.rc a")
    search.click

    content = driver.find_element(:css, "body")
    @affiliate_keyword = content.text.length
    driver.quit
  end

  def create
    @affiliate = Affiliate.new(affiliate_params)
    @affiliate.save
      redirect_to affiliate_path(@affiliate)
  end

  private
  def affiliate_params
    params.require(:affiliate).permit(:keyword)
  end
end