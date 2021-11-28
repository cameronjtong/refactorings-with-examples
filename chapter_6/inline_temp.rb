#before

base_price = an_order.base_price
return (base_price > 1000)

#after
#expresssion is very simple, no need to introduce a temp

return (an_order.base_price > 1000)