extends Control

signal uppgrade_chosen(uppgrade: String)


@onready var LC1: level_choice = %level_choice
@onready var LC2: level_choice = %level_choice2
@onready var LC3: level_choice = %level_choice3

func _ready() -> void:
	print("Buttons: ", LC1, LC2, LC3)
	print(get_random_3_abilities())

func get_random_3_abilities() -> Array:
	var all = abilityDatabase.abilities
	all.append_array(abilityDatabase.upgrades)
	for i in all:
		print(all[i].name)
		
	var level_choice_list: Array[level_choice] = [LC1, LC2, LC3]
	var abilities= []
	
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
	uppgrade_chosen.emit(sender.upgrade.id)
	print("Du tryckte på:", sender.name)
	print("Och valde ability:", sender.upgrade.name)
	pause_game()
	queue_free()
	
func pause_game():
	if !get_tree().paused:
		get_tree().paused = true
	else:
		get_tree().paused = false
