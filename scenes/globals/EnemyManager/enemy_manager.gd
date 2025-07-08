extends Node2D

var enemy_scene: PackedScene = preload("res://scenes/enemy/enemy.tscn")

func spawn_enemy(container: Node2D, on_spawn_signal: Signal):
	var enemy = enemy_scene.instantiate()
	var viewport_rect = get_viewport_rect()
	
	# gera coordenadas aleatórias dentro do viewport
	var view_port_x = randf_range(0, viewport_rect.size.x)
	var view_port_y = randf_range(0, viewport_rect.size.y)
	
	# cria os inimigos
	enemy.position = Vector2(view_port_x, view_port_y)
	container.add_child(enemy)
	on_spawn_signal.emit()
