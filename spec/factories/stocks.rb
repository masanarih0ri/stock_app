FactoryBot.define do
  factory :stock do
    stock_code { 1234 }
    stock_name { '日本カンパニー' }
    registered_year { 2018 }
    registered_month { 9 }
    per { 12.4 }
    pbr { 2.3 }
    capital_adequacy_ratio { 44.2 }
    last_year_sales { 1000 }
    this_year_sales { 1200 }
    next_year_sales { 1500 }
    last_year_sales_profit { 500 }
    this_year_sales_profit{ 600 }
    next_year_sales_profit{ 700 }
    last_year_net_profit { 100 }
    this_year_net_profit { 200 }
    next_year_net_profit { 300 }
    last_year_eps { 35.2 }
    this_year_eps { 45.3 }
    next_year_eps { 55.4 }
    last_year_dividend { 12.3 }
    this_year_dividend { 13.3 }
    next_year_dividend { 15.4 }
    this_year_dividend_yield { 3.4 }
    comment { 'テストです' }
    # このuserはusers.rbのなかで定義をした:userという名前のfactoryをstockモデルに定義されたuserという名前の関連を生成するのに利用する、という意味になる
    user
  end
end
