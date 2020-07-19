require_relative "store_aplication"
# DSL Singleton
StoreApplication.config do |app|
  app.name = "My store"
  app.enviroment = :production

  app.admin do |admin|
    admin.email = "hd321kbps@yandex.ru"
    admin.login = "admin"
    admin.send_info_emails_on :mondays
  end
end

# Заморожен ли объект
unless StoreApplication.frozen?
  StoreApplication.name = "My name"
end
# StoreApplication::Admin.email = "new@email.com"
p StoreApplication::Admin.email

@items = []
@items = VirtualItem.new({:price => 101, :weight => 100, :name => "car"})
@items = AntiqueItem.new("car", price: 201, weight: 100)
@items = RealItem.new({:price => 100, :weight => 100, :name => "kettle"})
@items = RealItem.new({:price => 100, :weight => 100, :name => "dishwasher"})

cart = Cart.new("igor")
cart.add_item RealItem.new({:price => 100, :weight => 100, :name => "car"})
cart.add_item RealItem.new({:price => 200, :weight => 100, :name => "car"})
cart.add_item RealItem.new({:price => 150, :weight => 100, :name => "kettle"})

method = "all_cars"
p cart.send(method)

order = Order.new
@items.each { |i| order.add.item(i) }
order.place
puts order.placed_at
# Кастомная дата и время
puts order.placed_at.strftime("%b %-d, %Y %H:%M:%S") # Jan 1, 1970 15:00:00
# Сколько времени заняла отправка письма
puts order.time_spend_on_sending_email