module ApplicationHelper

  def print_stock(stock)
    if stock > 10
      "<span class='in_stock'>In Stock (XX)</span>"
    else
      "<span class='out_stock'>Out of Stock</span>"
    end
  end

end
