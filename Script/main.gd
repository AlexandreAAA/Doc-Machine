extends Node2D

@export var robot : Node2D
@export var end_timer_time := 300.0
@export var end_timer : Timer
@export var download_window : Sprite2D
@export var prog_bar : TextureProgressBar
@export var dl_time_display : RichTextLabel
@export var dl_started : bool
@export var destination : Vector2

func _ready() -> void:
	end_timer.wait_time = end_timer_time
	download_window.visible = false
	dl_started = false
	download_window.transform.origin = Vector2(600,600)
	download_window.scale = Vector2(0.1, 0.1)
	robot.scale = Vector2(0.1, 0.1)
	destination = Vector2(600,80)
	
func _process(delta: float) -> void:
	if !dl_started :
		prog_bar.value = 0.0
	if dl_started : 
		prog_bar.value = (end_timer_time - end_timer.time_left)
		update_displayed_time()
	if robot.win_achieved == true:
		end_timer.stop()
		prog_bar.value = 300.0

func _on_end_timer_timeout() -> void:
	robot.ending(false)
		
func intro():
	dl_started = true
	download_window.visible = true	
	prog_bar.value = 0.0
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(download_window,"position", destination, 0.3)
	tween.parallel().tween_property(download_window,"scale", Vector2(0.6, 0.6), 0.3)
	await get_tree().create_timer(2).timeout
	var robo_tween = get_tree().create_tween()
	robo_tween.parallel().tween_property($Robot,"position", Vector2(-200,60), 0.1)
	robo_tween.parallel().tween_property($Robot,"scale", Vector2(1, 1), 0.1)
	robot.audio._musicPlay()
	robot.change_sprite(0,0,6)
	robot.rotate_sprite(0,0,0)
	robot.talk("Intro1")
	robot.audio._playVoiceLine("IntroPreDL",true)
	await robot.audio.fini_de_jouer
	robot.talk("Intro2")
	robot.change_sprite(12,12,9)
	robot.rotate_sprite(0,0,0)
	robot.audio._playVoiceLine("Intro2",true)
	await robot.audio.fini_de_jouer
	robot.talk("Intro3")
	robot.change_sprite(13,13,4)
	robot.rotate_sprite(0,0,0)
	robot.audio._playVoiceLine("Intro3",true)
	await robot.audio.fini_de_jouer
	robot.talk("Intro4")
	robot.change_sprite(8,9,3)
	robot.rotate_sprite(0,0,0)
	robot.audio._playVoiceLine("Intro4",true)
	await robot.audio.fini_de_jouer
	robot.talk("Intro5")
	robot.change_sprite(1,2,0)
	robot.rotate_sprite(0,0,0)
	robot.audio._playVoiceLine("Intro5",true)
	await robot.audio.fini_de_jouer
	robot.timer_idle.start()
	robot.idle_timer_started = true

func update_displayed_time():
	var minute = int(end_timer.time_left)/60
	var seconde = int(end_timer.time_left) % 60
	dl_time_display.text = str(minute) + ":" + str(seconde) + " minutes restantes"
	#dl_time_display.text = str(snapped(end_timer.time_left/60, 0.01)) + " minutes restantes"
	if robot.win_achieved == true : 
		dl_time_display.text = "0 minutes restantes"
		
func _on_video_stream_player_finished() -> void:
	if !dl_started :
		prog_bar.value = 0.0
		end_timer.start(end_timer_time)
		intro()
		robot.audio.NotifsStream.play()

func _on_startup_timer_timeout() -> void:
	robot.audio.StartUpStream.play()
