extends Node2D

signal enemy_created
var enemy_scene: PackedScene = preload("res://scenes/enemy/enemy.tscn")
var enemies: int = 0

func _ready() -> void:
	$Timer.start()

func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(randi() % 300, randi() % 300)
	$Enemy.add_child(enemy)
	enemy_created.emit()
	enemies += 1

func _on_enemy_created() -> void:
	$Ui/EnemyCounter/MarginContainer/Label.text = "Enemies: " + str(enemies)
