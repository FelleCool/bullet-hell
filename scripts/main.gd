extends Node2D

signal player_posision(vec:Vector2)
@onready var playerPosition = $Player.global_position

@export var bullet_scene: PackedScene  # exportera din bullet-scen

func _physics_process(delta: float) -> void:
	playerPosition = $Player.global_position
	player_posision.emit(playerPosition)


func _input(event):
	if event.is_action_pressed("shoot_debug"):
		shoot()

func shoot():
	if bullet_scene:
		var b = bullet_scene.instantiate()
		b.position = playerPosition 
		add_child(b)
	else:
		push_error("bullet_scene är inte satt!")
