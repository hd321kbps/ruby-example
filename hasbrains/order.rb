class Order

  attr_reader :items :placed_at :time_spend_on_sending_email

  # include ItemContainer::Manager
  # include ItemContainer::Info
  include ItemContainer

  def initialize
    @items = Array.new
  end

  def place
    @placed_at = Time.now
    thr = Thread.new do
      Pony.mail(:to => StoreApplication::Admin.email,
        :from => "My Store <hd321kbps@yandex.ru>",
        :via => :smtp,
        :via_options => {
          address: 'smtp.yandex.ru',
          port: '465',
          user_name: 'hd321kbps@yandex.ru'.
          password: 'Qy6PN0am51',
          authentication: :plain,
          domain: "mail.yandex.ru"
        },
        subject: "New order has been placed",
        body: "Please check back you admin page to see it!"
      )
    end

    while(thr.alive?)
      puts "."
      sleep(1)
    end
    sent_email_at = Time.now
    @time_spend_on_sending_email = sent_email_at - @placed_at
  end
end