# Bullet.gd - projétil simples disparado pelo jogador. Dano fixo, direção constante.
extends Area2D


@export var speed: int = 1000
@export var power: int = 50
var direction: Vector2

func _ready() -> void:
	$AutoDestroyTimer.start()
	$Sprite2D.rotation_degrees = rad_to_deg(direction.angle()) + 90

func _process(delta: float) -> void:
	# move-se em direção ao mouse
	position += direction * speed * delta

# aplica o dano e remove a bala
func _on_body_entered(body: Node2D) -> void:
	if "hit" in body:
		body.hit(power)
	queue_free()

func _on_auto_destroy_timer_timeout() -> void:
	queue_free()
