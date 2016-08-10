class HomeController < ApplicationController
  def index
  end

  def about
  end

  def products
  end

  def agents
    @message = Message.new
  end

  def contact
  end
end
