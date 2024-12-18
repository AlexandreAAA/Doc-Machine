extends Node2D

@export var robot : Node2D
@export var end_timer_time := 300.0
@export var end_timer : Timer
@export var download_window : Sprite2D
@export var prog_bar : TextureProgressBar
@export var dl_started : bool
var pb_value : float

func _ready() -> void:
	end_timer.wait_time = end_timer_time
	download_window.visible = false
	end_timer.start(end_timer_time)

func _process(delta: float) -> void:
	if !dl_started :
		dl_start()
	prog_bar.value = (end_timer_time - end_timer.time_left)
	if end_timer.time_left <= 110:
		pass

func _on_end_timer_timeout() -> void:
	robot.ending(false)
		
func dl_start():
	dl_started = true
	download_window.visible = true	
	prog_bar.max_value = end_timer_time
	pass
