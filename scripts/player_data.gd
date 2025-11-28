extends Node

var active_abilities: Array[Ability] =[]
var active_uppgrades: Array[Upgrade] = []

var db_abilities: Array[Ability] = abilityDatabase.abilities
var db_upgrades: Array[Upgrade] = abilityDatabase.upgrades


func id_checker(id:String):
	
	
func category(testing):
	if testing is Ability:
		return Ability
	elif testing is Upgrade:
		return Upgrade
	else:
		return "fel data typ"
