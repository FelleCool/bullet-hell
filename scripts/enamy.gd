extends CharacterBody2D

var hp = 10
var speed := 1


func take_damage(damage):
	hp -= damage
	if(hp<=0):
		die()

func die():
	queue_free()


func _on_main_player_posision(vec: Vector2) -> void:
	print(vec)
	var direction = (vec - global_position).normalized()
	position += direction * speed 
