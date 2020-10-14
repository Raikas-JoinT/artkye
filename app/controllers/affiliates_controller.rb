class AffiliatesController < ApplicationController
  def index
    @affiliate = Affiliate.new
  end

  def show
    @affiliate_sites = Affiliate.affiliate_sites(params)
    @affiliate_titles = @affiliate_sites.map {|affiliate_site| affiliate_site[:title]}
    @affiliate_links = @affiliate_sites.map {|affiliate_site| affiliate_site[:link]}
    @affiliate_times = @affiliate_sites.map {|affiliate_site| affiliate_site[:time]}
    binding.pry
    # @affiliate_site_info = Affiliate.site_info(params)
    # @affiliate_site_urls = Affiliate.site_urls(params)
    # @affiliate_site_titles = Affiliate.site_titles(params)
    # @affiliate_article_tag = Affiliate.article_tag(params)
    # @affiliate_site_word_counts = Affiliate.site_word_counts(params)



    # affiliate = Affiliate.find(params[:id])
    # affiliate = affiliate.keyword
    # d = Selenium::WebDriver.for :chrome

    # d.navigate.to "https://www.google.co.jp/"
    # inputElement = d.find_element(:name, 'q')
    # inputElement.send_keys affiliate
    # inputElement.submit

    # search = d.find_element(:css, "div.rc a")
    # search.click

    # tags = []
    # d.find_elements(:css, 'h2').each do |tag|
    #   tags << tag.find_element(:css, 'h2').text
    # end

    # @affiliate_article_tags = tags
    # d.quit
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