class PortfoliosController < ApplicationController
  def index
	@portfolio = Portfolio.all
  end

def new
	@portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio is now live.' }
      else
        format.html { render :new }
      end
    end
  end

 def edit
  @portfolio = Portfolio.find(params[:id])
end

def update
   @portfolio = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
   @portfolio = Portfolio.find(params[:id]) 
  end

  def destroy
    # this is going to perform the lookup
    @portfolio = Portfolio.find(params[:id]) 

    # thie si going to destroy/ delete the record
    @portfolio.destroy

    # redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end


end
