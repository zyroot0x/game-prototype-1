extends CharacterBody2D

var player = null
const SPEED = 80

func _ready():
	player = get_node("/root/Main/Player")

func _physics_process(_delta):
	if player:
		var direction = (player.position - position).normalized()
		velocity = direction * SPEED
		move_and_slide()
