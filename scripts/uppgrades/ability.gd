extends Resource
class_name Ability

@export var id: String
@export var name: String
@export var description: String
@export var icon: Texture2D

#ability data
@export var level: int = 1
@export var max_level: int = 5
@export var damage: int = 0
@export var cooldown: float = 1.0
@export var duration: float = 1.0

func apply_upgrade():
	if level < max_level:
		level += 1
		damage += 10
		cooldown -= 0.1
