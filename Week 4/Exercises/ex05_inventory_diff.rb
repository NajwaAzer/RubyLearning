old_inventory, new_inventory  = 'old-inventory.txt', 'new-inventory.txt'

old_inventory_contents = File.readlines(old_inventory)
new_inventory_contents = File.readlines(new_inventory)

puts new_inventory_contents - old_inventory_contents