class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
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

end