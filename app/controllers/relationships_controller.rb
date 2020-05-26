class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def following
  end

  def follower
  end
end
