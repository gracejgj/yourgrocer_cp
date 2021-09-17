module ProductsHelper

  def print_quantity(quantity)
    if quantity.to_i > 10
      return true
    else
      return false
    end
  end

end
