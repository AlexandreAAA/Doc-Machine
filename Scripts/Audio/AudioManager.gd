extends Node2D

@export var AlarmStream : AudioStreamPlayer2D
@export var CorbeilleStream : AudioStreamPlayer2D
@export var ErrorStream : AudioStreamPlayer2D
@export var NotifsStream : AudioStreamPlayer2D
@export var SonnerieStream : AudioStreamPlayer2D
@export var StartUpStream : AudioStreamPlayer2D
@export var TadaStream : AudioStreamPlayer2D

@export var debug : bool


func _playAtInput() -> void:
	if Input.is_action_pressed("TestSon") :
		AlarmStream.play()
		
func _changeClipAtInput(plusOne : int) :
	if Input.is_action_pressed("ChangeSon") :
		print("Son Changer")
		
		
func _alarmPlay() -> void :
	AlarmStream.play()
	
func _corbeillePlay() -> void :
	CorbeilleStream.play()
	
func _errorPlay() -> void :
	ErrorStream.play()
	
func _notifsPlay() -> void :
	NotifsStream.Play()
	
func _sonneriePlay() -> void :
	SonnerieStream.play()
	
func _startUpPlay() -> void :
	StartUpStream.play()
	
func  _tadaPlay() -> void :
	TadaStream.play()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if debug :
		_playAtInput()
		
	
