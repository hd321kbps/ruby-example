require "rspec"
require_relative "item"
require_relative "virtual_item"

describe Item do

  before(:each) do
    @item = Item.new("kettle", price: 200)
  end

  # Запускаеться 1 раз перед
  # before(:all) do
  #   @item = Item.new("kettle", price: 200)
  # end

  # Запусткаються после
  # after(:each) {}
  # after(:all) {}

  # Описание теста
  it "calculates price according to a special formula" do
    # item = Item.new("kettle", price: 200)
    # Пройдет ли тест
    @item.price.should == 270
    @item.price = 300
  end

  it "returns info about an object" do
    @item.to_s.should == "kettle:270.0"
  end

  it "calculates tax" do
    @item.send(:tax).should_not be_nil
  end
end
