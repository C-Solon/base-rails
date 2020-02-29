class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all.order({ :created_at => :desc })

    render({ :template => "transactions/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @transaction = Transaction.where({:id => the_id }).at(0)

    render({ :template => "transactions/show.html.erb" })
  end

  def create
    @transaction = Transaction.new
    @transaction.portfolio_id = params.fetch("portfolio_id_from_query")
    @transaction.transaction_type = params.fetch("transaction_type_from_query")
    @transaction.date_of_opening = params.fetch("date_of_opening_from_query")
    @transaction.date_unwinded = params.fetch("date_unwinded_from_query")
    @transaction.quoted_entity_id = params.fetch("quoted_entity_id_from_query")
    @transaction.quantity = params.fetch("quantity_from_query")

    if @transaction.valid?
      @transaction.save
      redirect_to("/transactions", { :notice => "Transaction created successfully." })
    else
      redirect_to("/transactions", { :notice => "Transaction failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @transaction = Transaction.where({ :id => the_id }).at(0)

    @transaction.portfolio_id = params.fetch("portfolio_id_from_query")
    @transaction.transaction_type = params.fetch("transaction_type_from_query")
    @transaction.date_of_opening = params.fetch("date_of_opening_from_query")
    @transaction.date_unwinded = params.fetch("date_unwinded_from_query")
    @transaction.quoted_entity_id = params.fetch("quoted_entity_id_from_query")
    @transaction.quantity = params.fetch("quantity_from_query")

    if @transaction.valid?
      @transaction.save
      redirect_to("/transactions/#{@transaction.id}", { :notice => "Transaction updated successfully."} )
    else
      redirect_to("/transactions/#{@transaction.id}", { :alert => "Transaction failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @transaction = Transaction.where({ :id => the_id }).at(0)

    @transaction.destroy

    redirect_to("/transactions", { :notice => "Transaction deleted successfully."} )
  end
end
