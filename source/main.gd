extends Node2D

@export var line: CharacterBody2D
@export var player_one: CharacterBody2D
@export var player_two: CharacterBody2D

var health := 100
var enemies: Array[EnemyCharacter]


func _physics_process(_delta: float) -> void:
	line.set_end_positions(player_one.position, player_two.position)
