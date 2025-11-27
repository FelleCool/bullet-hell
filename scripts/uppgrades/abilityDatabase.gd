extends Node
class_name AbilityDatabase

var abilities: Array[Ability] = []
var upgrades: Array[Upgrade] = []

func _ready():
	load_abilities()
	load_upgrades()

var dir := DirAccess.open("res://scripts/uppgrades/data/")

func file_type(file):
	return load("res://scripts/uppgrades/data/" + file)

func load_abilities():
	if !dir:
		print(dir)
		return
		
	for file in dir.get_files():
		if file.ends_with(".tres"):
			print(file_type(file))
			if file_type(file) is Ability:
				var ability: Ability = file_type(file)
				print(ability)
				abilities.append(ability)
			else :
				print("1 fale")
				pass
				
	print("Loaded abilities:", abilities)

func load_upgrades():
	if !dir:
		return
		
	for file in dir.get_files():
		if file.ends_with(".tres"):
			if file_type(file) is Upgrade:
				var upgrade: Upgrade = file_type(file)
				print(upgrade)
				upgrades.append(upgrade)
			else :
				print("2 fale")
				pass
				
	print("Loaded upgrades:", upgrades)
