class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def create
    @stock = Stock.new(stock_params)

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
    @stock = Stock.find(params[:id])
  end

  def update
    stock = Stock.find(params[:id])
    stock.update!(stock_params)
    redirect_to stocks_url, notice: "#{stock.stock_name}のデータを更新しました"
  end

  def destroy
    stock = Stock.find(params[:id])
    stock.destroy
    redirect_to stocks_url, notice: "#{stock.stock_name}のデータを削除しました"
  end

  private

  def stock_params
    # 受け取る想定でないデータを送られた場合に不正なデータが登録、更新されないようにする
    params.require(:stock).permit(:stock_code, :stock_name, :registered_year, :registered_month, :per, :pbr, :capital_adequacy_ratio, :last_year_sales, :this_year_sales, :next_year_sales, :last_year_sales_profit, :this_year_sales_profit, :next_year_sales_profit, :last_year_net_profit, :this_year_net_profit, :next_year_net_profit, :last_year_eps, :this_year_eps, :next_year_eps, :last_year_dividend, :this_year_dividend, :next_year_dividend, :this_year_dividend_yield, :comment)
  end
end
