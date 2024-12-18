extends Node2D

@export var robot : Node2D
@export var end_timer_time := 300.0
@export var end_timer : Timer
@export var download_window : Sprite2D
@export var prog_bar : TextureProgressBar
@export var dl_time_display : RichTextLabel
@export var dl_started : bool
@export var destination : Vector2
@export var speed : float

func _ready() -> void:
	end_timer.wait_time = end_timer_time
	download_window.visible = false
	end_timer.start(end_timer_time)
	download_window.transform.origin = Vector2(600,600)
	download_window.scale = Vector2(0.1, 0.1)
	destination = Vector2(600,80)
	speed = 1500.0
	
func _process(delta: float) -> void:
	if !dl_started :
		dl_start()
	prog_bar.value = (end_timer_time - end_timer.time_left)
	update_displayed_time()
	if end_timer.time_left <= 110:
		pass

func _on_end_timer_timeout() -> void:
	robot.ending(false)
		
func dl_start():
	dl_started = true
	download_window.visible = true	
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(download_window,"position", destination, 0.3)
	tween.parallel().tween_property(download_window,"scale", Vector2(0.6, 0.6), 0.3)
	
func update_displayed_time():
	dl_time_display.text = str(snapped(end_timer.time_left/60, 0.01)) + " minutes restantes"
