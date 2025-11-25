extends Resource
class_name Ability

@export var id: String
@export var name: String
@export var description: String
@export var icon: Texture2D

#ability data
@export var damage: int = 0
@export var cooldown: float = 1.0
@export var duration: float = 1.0
