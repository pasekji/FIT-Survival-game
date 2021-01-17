extends Node

const SlotClass = preload("res://src/Inventory/Slot.gd")
const ItemClass = preload("res://src/Inventory/Item.gd")
const NUM_INVENTORY_SLOTS = 20

var inventory = {
}

func _ready():
	if Global.ISIC == true:
		for key in inventory.keys():
			if key.name == 'isic':
				print("mam isic")

func add_item(item_name, item_quantity):
	if item_name == 'coffee-cup' and Global.cups10 == false:
		check_quest10()
	if item_name == 'backup-keys':
		Global.backup_keys = true
		erase_quest_item()
	if item_name == 'keyboard':
		Global.keyboard = true
	for item in inventory:
		if inventory[item][0] == item_name:
			var stack_size = int(JsonData.item_data[item_name]["StackSize"])
			var able_to_add = stack_size - inventory[item][1]
			if able_to_add >= item_quantity:
				inventory[item][1] += item_quantity
				return
			else:
				inventory[item][1] += able_to_add
				item_quantity = item_quantity - able_to_add
	
	# item doesn't exist in inventory yet, so add it to an empty slot
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = [item_name, item_quantity]
			return

func erase_quest_item():
	for item in inventory:
		print(inventory[item][0], inventory[item][1])
		if inventory[item][0] == 'backup-keys' and inventory[item][1] == 10:
			inventory.erase(item)
			return

func check_quest10():
	var amount = 0
	for key in inventory:
		if inventory[key][0] == 'coffee-cup':
			amount = amount + inventory[key][1]
			if amount >= 10:
				Global.cups10 = true
				return

func remove_item(slot: SlotClass):
	inventory.erase(slot.slot_index)

func add_item_to_empty_slot(item: ItemClass, slot: SlotClass):
	inventory[slot.slot_index] = [item.item_name, item.item_quantity]

func add_item_quantity(slot: SlotClass, quantity_to_add: int):
	inventory[slot.slot_index][1] += quantity_to_add
