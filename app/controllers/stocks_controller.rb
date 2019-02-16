class StocksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @stocks = current_user.stocks.recent
  end

  def show
  end

  def create
    @stock = current_user.stocks.new(stock_params)

    if @stock.save
      redirect_to stocks_url, notice: "#{@stock.stock_name}の株データを登録しました"
    else
      render :new
    end
  end

  def new
    @stock = Stock.new
  end

  def edit
  end

  def update
    @stock.update!(stock_params)
    redirect_to stocks_url, notice: "#{@stock.stock_name}のデータを更新しました"
  end

  def destroy
    @stock.destroy
    redirect_to stocks_url, notice: "#{@stock.stock_name}のデータを削除しました"
  end

  private

  def stock_params
    # 受け取る想定でないデータを送られた場合に不正なデータが登録、更新されないようにする
    params.require(:stock).permit(:stock_code, :stock_name, :registered_year, :registered_month, :per, :pbr, :capital_adequacy_ratio, :last_year_sales, :this_year_sales, :next_year_sales, :last_year_sales_profit, :this_year_sales_profit, :next_year_sales_profit, :last_year_net_profit, :this_year_net_profit, :next_year_net_profit, :last_year_eps, :this_year_eps, :next_year_eps, :last_year_dividend, :this_year_dividend, :next_year_dividend, :this_year_dividend_yield, :comment)
  end

  def set_task
    @stock = current_user.stocks.find(params[:id])
  end
end
