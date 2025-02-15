class_name EnemyCharacter extends CharacterBody2D

static var PLAYER_GROUP = "player_objects"

signal body_hit(damage: int)

@export var _collision_area: Area2D
@export var damage_amount := 10


func _ready() -> void:
	_collision_area.body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(PlayerCharacter.PLAYER_GROUP):
		body_hit.emit(damage_amount)
