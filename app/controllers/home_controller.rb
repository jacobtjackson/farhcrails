class HomeController < ApplicationController
  def index
    @message = Message.new
  end

  def about
    @message = Message.new
  end

  def products
    @message = Message.new
  end

  def carriers
    @message = Message.new
  end

  def agents
    @message = Message.new
    @contract_package = ContractPackage.last
  end

  def contact
    @message = Message.new
  end
end
