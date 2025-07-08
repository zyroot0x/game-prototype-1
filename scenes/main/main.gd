extends Node2D

signal enemy_created

func _ready() -> void:
	# no futuro, esse timer deve sair do main:
	# 1- main.gd deve apenas gerenciar esse tempo
	# 2- o timer deve ser acessado por EnemyManager
	$EnemiesCreation.start()

# criação de inimigos
func _on_timer_timeout() -> void:
	# no futuro, EnemyManager deve saber onde "EnemyContainer" está
	EnemyManager.spawn_enemy($EnemyContainer, enemy_created)

func _on_enemy_created() -> void:
	# no futuro, a contagem de inimigos deve acontecer no próprio UiManager
	UI.update_enemy_counter(1)

# disparos
func _on_player_shoot(bullet_position: Variant, bullet_direction: Variant) -> void:
	ProjectileManager.spawn_bullet($Projectiles, bullet_position, bullet_direction)
