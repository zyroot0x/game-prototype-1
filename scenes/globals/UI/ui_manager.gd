extends CanvasLayer

@onready var enemy_label: Label = $EnemyCounter/MarginContainer/Label
var enemies: int = 0

func update_enemy_counter(count: int):
	enemies += count
	enemy_label.text = "Enemies created: " + str(enemies)
