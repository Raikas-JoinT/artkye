class Affiliate < ApplicationRecord

  # def self.keyword_info(params)
  #   affiliate = Affiliate.find(params[:id])
  #   affiliate = affiliate.keyword
  #   d = Selenium::WebDriver.for :chrome

  #   d.navigate.to "https://www.google.co.jp/"
  #   inputElement = d.find_element(:name, 'q')
  #   inputElement.send_keys affiliate
  #   inputElement.submit

  #   search = d.find_element(:css, "div.rc a")
  #   search.click

  #   content = d.find_element(:tag_name, "body")

  #   affiliate_info = content.text.length
  #   d.quit
  #   return affiliate_info
  # end

end