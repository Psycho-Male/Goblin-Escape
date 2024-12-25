extends Node2D

const SPEED = 60
var direction = 1


@onready var ray_cast_right = $RayCast2DRight
@onready var ray_cast_left  = $RayCast2DLeft
@onready var sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		sprite.flip_h = false
	
	position.x += direction * SPEED * delta