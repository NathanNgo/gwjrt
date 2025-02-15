extends Node2D

@export var line: CharacterBody2D
@export var player_one: CharacterBody2D
@export var player_two: CharacterBody2D
@export var enemies_container: Node2D
@export var enemy_spawn_timer: Timer

var health := 100


func _ready() -> void:
	for enemy in enemies_container.get_children():
		enemy.body_hit.connect(_on_body_hit)

	enemy_spawn_timer.timeout.conenct(_on_enemy_spawn_timer_timeout)


func _physics_process(_delta: float) -> void:
	line.set_end_positions(player_one.position, player_two.position)


func _on_body_hit(damage: int) -> void:
	health -= damage


func _on_enemy_spawn_timer_timeout():
	pass