extends CharacterBody2D

signal shoot(pos, dir)

@export var speed: int = 500
@export var cooldown: float = 2
var can_shoot: bool = true

func _process(_delta: float) -> void:
	# player olha pro mouse
	look_at(get_global_mouse_position())
	
	# ataques do player
	if Input.is_action_just_pressed("primary_action") and can_shoot:
		$Timer.one_shot = true
		$Timer.wait_time = cooldown
		$Timer.start()
		can_shoot = false
		var bullet_position = $BulletSpawn.global_position
		var bullet_direction = (get_global_mouse_position() - global_position).normalized()
		shoot.emit(bullet_position, bullet_direction)

func _physics_process(_delta: float) -> void:
	# movimentos do player
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()

func _on_timer_timeout() -> void:
	can_shoot = true
