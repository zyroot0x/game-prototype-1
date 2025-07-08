extends Node

var bullet_scene: PackedScene = preload("res://scenes/bullet/bullet.tscn")

func spawn_bullet(container: Node2D, position: Vector2, direction: Vector2):
	var bullet = bullet_scene.instantiate()
	bullet.position = position
	bullet.direction = direction
	container.add_child(bullet)
