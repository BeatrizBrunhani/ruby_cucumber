require_relative '../base_page'

class CartView < BasePage
  attr_reader :box_cart

  def initialize
    @box_cart = EL['box_cart']
  end

  def box
    find(box_cart)
  end

  def total_cart
    box.find('tr', text: 'Total:').find('td')
  end
end  