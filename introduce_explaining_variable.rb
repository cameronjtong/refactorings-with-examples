#before => overcomplicated

if (platform.upcase.index("MAC") &&
    browser.upcase.index("IE") &&
    initialized? &&
    resize > 0
    )
#execute
else
  #something else
end

#after => introduce temps
is_mac_os = platform.upcase.index("MAC")
is_ie_browser = browser.upcase.index("IE")
was_resized = resize > 0
# note that replacing temp with query could also be an option, see below
if is_mac_os && is_ie_browser && was_resized
  #do it
else
  #dont do it
end

def is_mac_os?
  platform.upcase.index("MAC")
end

def is_ie_browser?
  browser.upcase.index("IE")
end

#example
# not super easy to follow
def price
  @quantity * @item_price -
  [0, @quantity - 500].max * @item_price * 0.05 +
  [@quantity * @item_price * 0.1, 100.0].min
end

#after
#rememeber that extracting the methods instead of leaving as temps allows for more modularity
def price
  base_price = @quantity * @item_price
  quantity_discount = [0, @quantity -500].max * @item_price * 0.05
  shipping = [@base_price * 0.1, 100].min
  return base_price - quantity_discount + shipping
end