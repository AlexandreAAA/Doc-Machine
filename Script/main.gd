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
@export var line1: bool
@export var line2: bool
@export var line3: bool
@export var line4: bool
@export var line5: bool

func _ready() -> void:
	end_timer.wait_time = end_timer_time
	download_window.visible = false
	end_timer.start(end_timer_time)
	download_window.transform.origin = Vector2(600,600)
	download_window.scale = Vector2(0.1, 0.1)
	robot.scale = Vector2(0.1, 0.1)
	destination = Vector2(600,80)
	line1 = false
	line2 = false
	line3 = false
	line4 = false
	line5 = false
	
func _process(delta: float) -> void:
	if !dl_started :
		intro()
	prog_bar.value = (end_timer_time - end_timer.time_left)
	update_displayed_time()
	#if line5:
		#robot.change_sprite(1,2,0)
		#robot.rotate_sprite(0,0,0)
		#robot.talk("Intro5")
	#elif line4:
		#robot.change_sprite(8,9,3)
		#robot.rotate_sprite(0,0,0)
		#robot.talk("Intro4")
		#line5 = true
	#elif line3:
		#robot.change_sprite(13,13,4)
		#robot.rotate_sprite(0,0,0)
		#robot.talk("Intro3")
		#line4 = true
	#elif line2:
		#robot.change_sprite(12,12,9)
		#robot.rotate_sprite(0,0,180)
		#robot.talk("Intro2")
		#line3 = true
	#elif line1:
		#robot.change_sprite(0,0,6)
		#robot.rotate_sprite(0,0,0)
		#robot.talk("Intro")
		#line2 = true
	#else:
		#pass
	if robot.win_achieved == true:
		prog_bar.value = 300.0

func _on_end_timer_timeout() -> void:
	robot.ending(false)
		
func intro():
	dl_started = true
	download_window.visible = true	
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
	if robot.audio._on_voice_stream_finished():
		intro2()
		
func intro2():
	robot.talk("Intro2")
	robot.audio._playVoiceLine("IntroPreDL",true)
	if robot.audio._on_voice_stream_finished():
		intro3()
		
func intro3():
	robot.talk("Intro3")
	robot.audio._playVoiceLine("IntroPreDL",true)
	if robot.audio._on_voice_stream_finished():
		intro4()
		
func intro4():
	robot.talk("Intro4")
	robot.audio._playVoiceLine("IntroPreDL",true)
	if robot.audio._on_voice_stream_finished():
		intro5()
		
func intro5():
	robot.talk("Intro5")
	robot.audio._playVoiceLine("IntroPreDL",true)	
	

	robot.audio._musicPlay()
	robot.timer_idle.start()


func update_displayed_time():
	dl_time_display.text = str(snapped(end_timer.time_left/60, 0.01)) + " minutes restantes"


func _on_video_stream_player_finished() -> void:
	dl_started = false
	robot.audio.NotifsStream.play()

func _on_startup_timer_timeout() -> void:
	robot.audio.StartUpStream.play()
