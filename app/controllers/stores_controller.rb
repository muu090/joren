require 'json'
require 'net/http'
require "uri"
class StoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @keyword = params[:keyword]

    data = {
      "key": ENV['API_KEY'],
      "keyword": @keyword,
      "format": "json"
    }
    
    query = data.to_query
    uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?" + query)
    res = Net::HTTP.get_response(uri)
    res_data = JSON.parse(res.body)

    results = res_data["results"]["shop"]
    if results
      @shops = Kaminari.paginate_array(results).page(params[:page]).per(5)
    end
  end
    
  def show
  end
end
