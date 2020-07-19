class Cart

  attr_reader :items

  # include ItemContainer::Manager
  include ItemContainer
  class ItemNotSupported < StandartError
  end

  UNSUPPORTED_ITEMS = [AntiqueItem, VirtualItem]

  def initialize(owner)
    @items = Array.new
    @owner = owner
  end

  def add_items(*items)
    @items += items
  end

  def save_to_file
    File.open("#{owner}_cart.txt", "w") do |f|
      @items.each do |i|
        raise ItemNotSupported if UNSUPPORTED_ITEMS.include?(i.class)
        f.puts i # car:100:50
      end
    end
  end

  def read_from_file
    begin
      File.readlines("#{owner}_cart.txt").each { |i| @items << i.to_real_item }    
      @items.uniq!
    rescue Errno::ENOENT
      File.open("#{owner}_cart.txt", "w") {}
      puts "File #{owner}_cart.txt created"
    end
  end

end