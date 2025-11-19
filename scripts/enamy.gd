extends CharacterBody2D

signal died(xp: int, pos: Vector2)

var hp = 10
var speed := 1
var xp := 10

func _ready() -> void:
	get_parent().connect("player_posision",  _on_main_player_posision)
	

func take_damage(damage):
	hp -= damage
	if(hp<=0):
		die()

func die():
	died.emit(xp, global_position)
	queue_free()


func _on_main_player_posision(vec: Vector2) -> void:
	var direction = (vec - global_position).normalized()
	position += direction * speed 
