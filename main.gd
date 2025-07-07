extends Node2D

signal enemy_created
var enemy_scene: PackedScene = preload("res://scenes/enemy/enemy.tscn")
var enemies: int = 0

func _ready() -> void:
	$Timer.start()

# criação de inimigos
func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	var viewport_rect = get_viewport_rect()
	
	# gera coordenadas aleatórias dentro do viewport
	var x = randf_range(0, viewport_rect.size.x)
	var y = randf_range(0, viewport_rect.size.y)
	
	# cria os inimigos
	enemy.position = Vector2(x, y)
	$EnemyContainer.add_child(enemy)
	enemies += 1
	enemy_created.emit()
	print("Inimigo criado em: ", enemy.position)


func _on_enemy_created() -> void:
	$Ui/EnemyCounter/MarginContainer/Label.text = "Enemies created: " + str(enemies)
