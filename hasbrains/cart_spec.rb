require "rspec"
require_relative "item"
require_relative "virtual_item"
require_relative "antique_item"
require_relative "item_container"
require_relative "cart"

describe Cart do
  # it "adds items into the cart" do
  #   cart = Cart.new("roman")
  #   item1 = Item.new("kettle", price: 200)
  #   item2 = Item.new("car", price: 200)
  #   cart.add_items(item1, item2)
  #   cart.items.should include(item1, item2)
  # end

  # it "makes sure the card is initialized correctly" do
  #   cart = Cart.new(...)
  #   cart.items.should be_kind_of(Array)
  #   cart.owner.should_not be_nil
  # end

  # Вложенный тест
  describe "managing items" do
    it "adds items into the cart" do
      cart = Cart.new("roman")
      item1 = Item.new("kettle", price: 200)
      item2 = Item.new("car", price: 200)
      cart.add_items(item1, item2)
      cart.items.should include(item1, item2)
    end
    it "remove items from itself 2"
  end

  # Pending тесты
  it "remove items from itself" do
    pending
  end
  it "counts items in itself"
  it "places order using all the items that were added into the cart"
  it "clears itself off the items after on order is placed"
end
