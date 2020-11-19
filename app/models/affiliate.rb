class Affiliate < ApplicationRecord
require 'google/apis/customsearch_v1'
require 'json'
require 'nokogiri'
require 'open-uri'

API_KEY = '****'
CSE_ID = '****'

def self.affiliate_sites(params)
  searcher = Google::Apis::CustomsearchV1::CustomSearchAPIService.new
  searcher.key = API_KEY
  keyword = Affiliate.find(params[:id]).keyword
  results = searcher.list_cses(q: keyword, cx: CSE_ID)
  items = results.items
  affiliate_sites = items.map {|item| { title: item.title, link: item.link, published_time: item.pagemap["metatags"].map{|published_time| published_time["article:published_time"]}, modified_time: item.pagemap["metatags"].map{|modified_time| modified_time["article:modified_time"]}} }
  return affiliate_sites
end

def self.article_tag(params)
  sq = method(:affiliate_sites)
  items = sq.call(params)

  urls = items.map {|affiliate_site| affiliate_site[:link]}
  url = urls[0]
  doc = Nokogiri::HTML(open(url))
  doc.css('h2').each do |link|
    article_tag = link.content
  end
end

def self.article_word_counts(params)
  sq = method(:affiliate_sites)
  items = sq.call(params)

  urls = items.map {|affiliate_site| affiliate_site[:link]}
  url = urls[0]
  doc = Nokogiri::HTML(open(url))

  word_counts = []

  doc.css('p').each do |content|
    word_counts << content.text.length
  end
  article_word_counts = word_counts.sum

end


  # def self.site_urls(params)
  #   affiliate = Affiliate.find(params[:id])
  #   affiliate = affiliate.keyword
  #   d = Selenium::WebDriver.for :chrome

  #   d.navigate.to "https://www.google.co.jp/"
  #   inputElement = d.find_element(:name, 'q')
  #   inputElement.send_keys affiliate
  #   inputElement.submit

  #   site_urls = []
  #   d.find_elements(:css, "div.rc").first(10).each do |url|
  #     site_urls << url.find_element(:tag_name, "a").attribute("href")
  #   end

  #   d.quit
  #   return site_urls
  # end

  # def self.site_titles(params)
  #   affiliate = Affiliate.find(params[:id])
  #   affiliate = affiliate.keyword
  #   d = Selenium::WebDriver.for :chrome

  #   d.navigate.to "https://www.google.co.jp/"
  #   inputElement = d.find_element(:name, 'q')
  #   inputElement.send_keys affiliate
  #   inputElement.submit

  #   site_titles = []
  #   d.find_elements(:css, "div.rc").first(10).each do |title|
  #     site_titles << title.find_element(:tag_name, "span").text
  #   end

  #   d.quit
  #   return site_titles
  # end

  # def self.article_tag(params)
  #   affiliate = Affiliate.find(params[:id])
  #   affiliate = affiliate.keyword
  #   d = Selenium::WebDriver.for :chrome

  #   d.navigate.to "https://www.google.co.jp/"
  #   inputElement = d.find_element(:name, 'q')
  #   inputElement.send_keys affiliate
  #   inputElement.submit

  #   search = d.find_element(:css, "div.rc a")
  #   search.click

  #   tags = []
  #   d.find_elements(:css, 'post').each do |tag|
  #     tags << tag.find_element(:css, 'span').text
  #   end

  #   article_tag = tags

  #   binding.pry

  #   d.quit

  #   return article_tag
  # end

  # def self.site_word_counts(params)
    # affiliate = Affiliate.find(params[:id])
    # affiliate = affiliate.keyword
    # d = Selenium::WebDriver.for :chrome

    # d.navigate.to "https://www.google.co.jp/"
    # inputElement = d.find_element(:name, 'q')
    # inputElement.send_keys affiliate
    # inputElement.submit

    # search = d.find_element(:css, "div.rc a")
    # search.click

    # content = d.find_element(:tag_name, "body")

    # site_word_counts = content.text.length
    # d.quit
    # return site_word_counts
  # end

end
