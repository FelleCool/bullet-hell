extends Node
class_name AbilityDatabase

var abilities: Array[Ability] = []

func _ready():
	load_abilities()


func load_abilities():
	var dir := DirAccess.open("res://scripts/uppgrades/data/")
	
	if dir:
		for file in dir.get_files():
			if file.ends_with(".tres"):
				var ability: Ability = load("res://scripts/uppgrades/data/" + file)
				print(ability)
				abilities.append(ability)

	print("Loaded abilities:", abilities)
