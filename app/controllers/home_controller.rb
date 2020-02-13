class HomeController < ApplicationController
  def show
  	 @gossip = Gossip.all
 
  end
end
