class PortfoliosController < ApplicationController
  def index
	@portfolio = Portfolio.all
  end
end
