class PortfoliosController < ApplicationController
  layout "portfolio"
  
  def index
	@portfolio = Portfolio.all
  end

  def angular
    @angular_portfolio = Portfolio.angular
end

def new
	@portfolio = Portfolio.new
  3.times { @portfolio.technologies.build }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

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
      if @portfolio.update(portfolio_params)
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

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                      )
  end

end
