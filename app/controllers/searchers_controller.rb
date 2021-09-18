class SearchesController < ApplicationController

  def _header
    if params['search']
      @products = Product.all.where('product LIKE ?', "%#{params['search']}%")
    else
      @products = Product.all
    end
  end
end
