class Affiliate < ApplicationRecord

  def self.keyword_info(params)
    affiliate = Affiliate.find(params[:id])
    affiliate = affiliate.keyword
    driver = Selenium::WebDriver.for :chrome

    driver.navigate.to "https://www.google.co.jp/"
    inputElement = driver.find_element(:name, 'q')
    inputElement.send_keys affiliate
    inputElement.submit

    search = driver.find_element(:css, "div.rc a")
    search.click

    content = driver.find_element(:css, "body")

    affiliate_info = content.text.length
    driver.quit
    return affiliate_info
  end

end