extends PlayerState

var input_direction_x := 0

func enter(previous_state_path: String, data := {}) -> void:
	player.animation_player.play("run")

func physics_update(delta: float) -> void:
	var input_direction_x = Input.get_axis("left", "right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit("falling")
	elif Input.is_action_just_pressed("jump"):
		finished.emit("jumping")
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit("idle")
