extends Area2D

var xp := 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#collect xp
func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body.name == "player":
		print("in xp")
		queue_free()
