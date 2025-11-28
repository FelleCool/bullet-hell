extends Control

signal uppgrade_chosen(uppgrade: String)


@onready var LC1: level_choice = %level_choice
@onready var LC2: level_choice = %level_choice2
@onready var LC3: level_choice = %level_choice3

func _ready() -> void:
	print("Buttons: ", LC1, LC2, LC3)
	for i in get_random_3_abilities():
		print(i.name)

func get_random_3_abilities() -> Array:
	var all = []
	all.append_array(abilityDatabase.abilities)
	all.append_array(abilityDatabase.upgrades)
	for i in all:
		print(i.name)
		
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
		if abilities[i] is Ability:
			choice.ability = abilities[i]
		elif abilities[i] is Upgrade:
			choice.upgrade = abilities[i]
		else:
			print("de matchar ingen va upgrade valen")
		
		choice.connect("pressed", _on_button_pressed.bind(choice))
	
	return abilities


func _on_button_pressed(sender: level_choice):
	print(sender)
	if sender.upgrade !=null:
		uppgrade_chosen.emit(sender.upgrade.id)
	elif sender.ability !=null:
		uppgrade_chosen.emit(sender.ability.id)
	else:
		print("Valet jar ingen data")
	
	print("Du tryckte på:", sender.name)
	pause_game()
	queue_free()
	
func pause_game():
	if !get_tree().paused:
		get_tree().paused = true
	else:
		get_tree().paused = false
