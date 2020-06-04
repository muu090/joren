require 'json'
require 'net/http'
require "uri"
class StoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @keyword = params[:keyword]  # ユーザが入力した検索キーワードをパラメータから取得

    data = {
      "key": ENV['API_KEY'],
      "keyword": @keyword,
      "format": "json"
    }
    
    query = data.to_query
    uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?" + query)
    res = Net::HTTP.get_response(uri)
    res_data = JSON.parse(res.body)

    results = res_data["results"]["shop"]  # 検索結果のjsonデータ(配列)をまるっと格納

    if results
      @shops = Kaminari.paginate_array(results).page(params[:page]).per(5)  # 検索結果を1ページ当たり5件まで表示
      
      shop_ids = results.map { |shop| shop["id"] } # 検索結果の中から、(API上の)idのみを配列で取り出す
      shop_ids.each do |shop_id|
        stores = Store.all
        store = stores.find_or_initialize_by(api_id: shop_id) # 検索結果から取り出したapi_idを元にStoreモデルを参照
        
        if store.new_record? # 新規データだった場合は保存する
          store = Store.new  
          store.api_id = shop_id
          store.save! 
        end
      end
    end
  end
  
  def show

    store = Store.find(params[:id]) # API上の店舗idを持ったモデル情報をパラメータのidを元に取得
    id = store.api_id  # 取得したモデル情報のapi_id(API上の店舗id)をidに代入
    
    data = {
      "key": ENV['API_KEY'],
      "id": id,
      "format": "json"
    }
    
    query = data.to_query
    uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?" + query)
    res = Net::HTTP.get_response(uri)
    res_data = JSON.parse(res.body)

    @shop = res_data["results"]["shop"]  # 検索結果のjsonデータ(配列)をまるっと格納
 
    ## チェックイン機能
    check_ins = CheckIn.where(user_id: current_user.id, store_id: params[:id])
    
    check_ins.each do |check_in|
      @check_in_today = check_in.created_at
    end

    @start_time = Time.zone.parse('0am')
    @end_time = Time.current

    @user = current_user.id

    @comments = Comment.where(store_id: params[:id]) # store_idに(API上の)店舗idを持ったコメントを全件取得
    
    @comments.each do |comment|
      @comment = comment.id
    end

    @store = Store.find(params[:id]) # コメントフォーム用に、開いているページの店舗idを持ったStoreモデルを1件取得
    @comment_new = Comment.new  
    
  end
end
