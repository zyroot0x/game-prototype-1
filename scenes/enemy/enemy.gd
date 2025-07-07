extends CharacterBody2D

@export var life: int = 100
var player = null
const SPEED = 80

func _ready():
	player = get_node("/root/Main/Player")

func _physics_process(_delta):
	# segue o jogador
	if player:
		var direction = (player.position - position).normalized()
		velocity = direction * SPEED
		move_and_slide()

func hit(damage: int):
	life -= damage
	$ProgressBar.value = life
	
	if life <= 0:
		queue_free()
