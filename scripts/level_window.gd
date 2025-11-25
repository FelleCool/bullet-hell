extends Control

@onready var LC1: level_choice = %level_choice
@onready var LC2: level_choice = %level_choice2
@onready var LC3: level_choice = %level_choice3

func _ready() -> void:
	print("Buttons: ", LC1, LC2, LC3)
	print(get_random_3_abilities())

func get_random_3_abilities() -> Array[Ability]:
	var all = abilityDatabase.abilities
	var level_choice_list: Array[level_choice] = [LC1, LC2, LC3]
	var abilities: Array[Ability] = []
	
	for i in range(3):
		abilities.append(all.pick_random())
		var choice = level_choice_list[i]
		
		choice.text = abilities[i].name
		choice.text += "\n" + abilities[i].description
		choice.icon = abilities[i].icon
		choice.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
		choice.vertical_icon_alignment = VERTICAL_ALIGNMENT_BOTTOM
		choice.upgrade = abilities[i]
		choice.connect("pressed", _on_button_pressed.bind(choice))
	
	return abilities


func _on_button_pressed(sender: level_choice):
	print("Du tryckte på:", sender.name)
	print("Och valde ability:", sender.upgrade.name)
