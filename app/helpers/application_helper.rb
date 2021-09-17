module ApplicationHelper

  def print_quantity(quantity)
    if stock > 10
      "<span class='in_quantity'>In Stock (XX)</span>"
    else
      "<span class='out_quantity'>Out of Stock</span>"
    end
  end

end
