# before
base_price = @quantity * @item_price

if base_price > 1000
  base_price * 0.95
else
  base_price * 0.98
end

#after

if base_price > 1000
  base_price * 0.95
else
  base_price * 0.98
end
#extract expression into method, can now be reused in other methods
def base_price
  @quantity * @item_price
end

#example
#two temps
def price
  base_price = @quantity * @item_price
  if base_price > 1000
    discount_factor = 0.95
  else
    discount_factor = 0.95
  end
  base_price * discount_factor
end

#after
#extracted right hand side of two temps
def price
  base_price * discount_factor
end

def base_price
  @quantity * @item_price
end

def discount_factor
  base_price > 1000 ? 0.95 : 0.98
end