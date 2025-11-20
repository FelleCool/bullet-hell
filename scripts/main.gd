extends Node2D

signal player_posision(vec:Vector2)


var player_position

@export var enamy_scene: PackedScene

@export var bullet_scene: PackedScene 

@export var xp_scene: PackedScene

@export var player_scene: PackedScene

func _ready() -> void:
	spawn_player()
	

func _physics_process(delta: float) -> void:
	#spelarens posion
	player_position = $player.global_position
	#singal som skickar i väg spelarens posion
	player_posision.emit(player_position)


func _input(event):
	if event.is_action_pressed("shoot_debug"):
		shoot()
	if event.is_action_pressed("spawn_left"):
		spawn_enamy()


func spawn_player():
	if player_scene:
		var p = player_scene.instantiate() 
		add_child(p)
	else:
		push_error("player_scene är inte satt!")

func spawn_enamy():
	if enamy_scene:
		var e = enamy_scene.instantiate()
		e.position = get_global_mouse_position() 
		e.connect("died", Callable(self, "_on_enemy_died"))
		add_child(e)
	else:
		push_error("enamy_scene är inte satt!")

#b för bullet har b för att bullet redan finns i de globala variablarna
func shoot():
	if bullet_scene:
		var b = bullet_scene.instantiate()
		b.position = player_position 
		add_child(b)
	else:
		push_error("bullet_scene är inte satt!")

func _on_enemy_died(xp:int , pos: Vector2):
	call_deferred("_spawn_xp_token", xp, pos)

func _spawn_xp_token(xp:int, pos: Vector2):
	if xp_scene:
		var xpToken = xp_scene.instantiate()
		xpToken.position = pos
		xpToken.set_meta("xp", xp)
		xpToken.connect("xp_collected", _xp_collected)
		add_child(xpToken)
	else:
		push_error("xp_scene är inte satt!")

func _xp_collected(xp: int):
	var xpBar = $Control/ProgressBar
	xpBar.value += xp
	if xpBar.value == 100:
		xpBar.value = 0
	
