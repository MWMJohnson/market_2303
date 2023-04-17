class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
    @total_inventory = Hash.new
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    items_list = @vendors.flat_map do |vendor|
      vendor.inventory.keys
    end
    items_list_names = items_list.map do |item|
      item.name
    end
    solo_items_list = items_list_names.uniq.sort
  end

  # def total_inventory
  #   sorted_item_list.each do |item|
  #     new_value_hash = Hash.new
  #     @total_inventory[item] = new_value_hash
  #     @total_inventory[item][:quantity] = @vendors.map do |vendor|
  #       vendor.inventory.values

  #     end
  #   end
  #   @total_inventory
  # end

  def total_inventory
    new_value_hash = Hash.new
    items_list = @vendors.flat_map do |vendor|
      vendor.inventory.keys
    end
    unique_items_list = items_list.uniq
    unique_items_list.map do |item|
      @total_inventory[item] = new_value_hash
    end
    @total_inventory
  end


end