module ProductsHelper

  def print_stock(stock)
    if stock.to_i > 10
      return true
    else
      return false
    end
  end

end
