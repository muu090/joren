class HomeController < ApplicationController

  def search
    params
    require 'json'
    require 'net/http'
    require "uri"
    
    data = {
      "key": ENV['API_KEY'],
      "large_area": params[:large_area],
      "middle_area": params[:middle_area],
      "genre": params[:genre],
      "format": "json"
    }

    query = data.to_query
    uri = URI("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?" + query)
    res = Net::HTTP.get_response(uri)
    @res_data = JSON.parse(res.body)
  end

  def top
  
  end
  
  def about
  end
end
