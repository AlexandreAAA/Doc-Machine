extends Node2D

@export var robot : Node2D
@export var end_timer_time := 120.0
@export var end_timer : Timer


func _ready() -> void:
	end_timer.wait_time = end_timer_time


func _process(delta: float) -> void:
	
	if end_timer.time_left <= 110:
		pass
