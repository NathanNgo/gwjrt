extends CharacterBody2D

@export var player_type := Player.FIRST
@export var speed := 100

enum Player {
	FIRST,
	SECOND
}

enum Controls {
	LEFT,
	RIGHT,
	UP,
	DOWN,
	INTERACT
}

var control_schemes := {
	Player.FIRST: {
		Controls.LEFT: "player_one_left",
		Controls.RIGHT: "player_one_right",
		Controls.UP: "player_one_up",
		Controls.DOWN: "player_one_down",
		Controls.INTERACT: "player_one_interact"
	},
	Player.SECOND: {
		Controls.LEFT: "player_two_left",
		Controls.RIGHT: "player_two_right",
		Controls.UP: "player_two_up",
		Controls.DOWN: "player_two_down",
		Controls.INTERACT: "player_two_interact"
	}
}

var selected_scheme: Dictionary = control_schemes[player_type]


func _physics_process(_delta: float) -> void:
	var direction = Vector2(
		Input.get_axis(selected_scheme[Controls.LEFT], selected_scheme[Controls.RIGHT]),
		Input.get_axis(selected_scheme[Controls.UP], selected_scheme[Controls.DOWN])
	).normalized()

	velocity = direction * speed
	move_and_slide()

	