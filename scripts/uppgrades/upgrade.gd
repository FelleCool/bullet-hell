extends Resource
class_name Upgrade


@export var id: String
@export var name: String
@export var description: String
@export var icon: Texture2D

#ability data
@export var level: int = 1
@export var max_level: int = 5
@export var value_change: int = 1
@export var level_value_change: int = 1


func apply_upgrade():
	if level < max_level:
		level += 1
		value_change += level_value_change
