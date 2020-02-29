class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all.order({ :created_at => :desc })

    render({ :template => "portfolios/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @portfolio = Portfolio.where({:id => the_id }).at(0)

    render({ :template => "portfolios/show.html.erb" })
  end

  def create
    @portfolio = Portfolio.new
    @portfolio.user_id = params.fetch("user_id_from_query")

    if @portfolio.valid?
      @portfolio.save
      redirect_to("/portfolios", { :notice => "Portfolio created successfully." })
    else
      redirect_to("/portfolios", { :notice => "Portfolio failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @portfolio = Portfolio.where({ :id => the_id }).at(0)

    @portfolio.user_id = params.fetch("user_id_from_query")

    if @portfolio.valid?
      @portfolio.save
      redirect_to("/portfolios/#{@portfolio.id}", { :notice => "Portfolio updated successfully."} )
    else
      redirect_to("/portfolios/#{@portfolio.id}", { :alert => "Portfolio failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @portfolio = Portfolio.where({ :id => the_id }).at(0)

    @portfolio.destroy

    redirect_to("/portfolios", { :notice => "Portfolio deleted successfully."} )
  end
end
