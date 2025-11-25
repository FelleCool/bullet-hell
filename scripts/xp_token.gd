extends Area2D

signal xp_collected(xp:int)

var xp_amount
#collect xp
func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body.name == "player":
		print("xp amount: ", get_meta("xp"))
		xp_collected.emit(get_meta("xp"))
		queue_free()
