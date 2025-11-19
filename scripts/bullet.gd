class_name bullet

extends Node2D

@export var damage = 10
@export var speed = 10
@export var shape: Shape2D  
@export var icon: Texture2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var cs = $cs2d
	if cs == null:
		push_error("CollisionShape2D saknas i bullet-scenen!")
		return
	assert(shape != null, "Bullet shape är inte satt!")
	cs.shape = shape
	
	$Sprite2D.texture = icon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * speed * delta


func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body.is_in_group("enemies"):  
		body.take_damage(damage)      
		queue_free()                  # ta bort bullet
	
