extends Node2D

@export var AlarmStream : AudioStreamPlayer2D
@export var CorbeilleStream : AudioStreamPlayer2D
@export var ErrorStream : AudioStreamPlayer2D
@export var NotifsStream : AudioStreamPlayer2D
@export var SonnerieStream : AudioStreamPlayer2D
@export var StartUpStream : AudioStreamPlayer2D
@export var TadaStream : AudioStreamPlayer2D
@export var VoiceStream : AudioStreamPlayer2D

@export var debug : bool

var VoiceBank = {}

var ca_va_mieux = preload("res://Audio/Voice/Bien/Ca va mieux.ogg")
var peche = preload("res://Audio/Voice/Bien/J'ai la peche.ogg")
var oh_oui = preload("res://Audio/Voice/Bien/Oh Oui.ogg")
var wesh = preload("res://Audio/Voice/Bien/Wesh ma gueule.ogg")

var adieu = preload("res://Audio/Voice/Pas bien/Adieu monde cruel.ogg")
var aide_moi = preload("res://Audio/Voice/Pas bien/Aide-moi.ogg")
var je_pars = preload("res://Audio/Voice/Pas bien/Ca y est je pars.ogg")
var depeche = preload("res://Audio/Voice/Pas bien/Depeche.ogg")
var fais_qqchose = preload("res://Audio/Voice/Pas bien/Fais quelque chose.ogg")
var gingle_netflix = preload("res://Audio/Voice/Pas bien/Gingle Netflix.ogg")
var mal = preload("res://Audio/Voice/Pas bien/J'ai Mal.ogg")
var pas_partir = preload("res://Audio/Voice/Pas bien/Je ne veux pas partir.ogg")
var sens_le_cloud = preload("res://Audio/Voice/Pas bien/Je sens le cloud.ogg")
var laisse_pas = preload("res://Audio/Voice/Pas bien/Ne me laisse pas.ogg")
var pire = preload("res://Audio/Voice/Pas bien/Pire.ogg")



func _playAtInput() -> void:
	if Input.is_action_pressed("TestSon") :
		_playVoiceLine("Pire")
		
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
	VoiceBank["Mieux"] = ca_va_mieux
	VoiceBank["peche"] = peche
	VoiceBank["oui"] = oh_oui
	VoiceBank["wesh"] = wesh
	VoiceBank["adieu"] = adieu
	VoiceBank["aide"] = aide_moi
	VoiceBank["pars"] = je_pars
	VoiceBank["depeche"] = depeche
	VoiceBank["fais quelquechose"] = fais_qqchose
	VoiceBank["gingle"] = gingle_netflix
	VoiceBank["j'ai mal"] = mal
	VoiceBank["pas partir"] = pas_partir
	VoiceBank["cloud"] = sens_le_cloud
	VoiceBank["laisse pas"] = laisse_pas
	VoiceBank["Pire"] = pire 
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if debug :
		_playAtInput()

func _playVoiceLine(voiceBankKey : String) -> void :
	VoiceStream.stream = VoiceBank[voiceBankKey]
	VoiceStream.play()
	
	
	
