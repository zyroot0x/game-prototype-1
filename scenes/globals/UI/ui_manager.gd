extends CanvasLayer

@onready var enemy_label: Label = $EnemyCounter/MarginContainer/Label
var enemies: int = 0

func update_enemy_counter(count: int):
	var initial_label_text: String = "Enemies created: "
	enemy_label.text = initial_label_text + str(enemies + count)
	enemies = int(enemy_label.text)
