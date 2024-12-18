extends Node2D

@export var AlarmStream : AudioStreamPlayer2D
@export var CorbeilleStream : AudioStreamPlayer2D
@export var ErrorStream : AudioStreamPlayer2D
@export var NotifsStream : AudioStreamPlayer2D
@export var SonnerieStream : AudioStreamPlayer2D
@export var StartUpStream : AudioStreamPlayer2D
@export var TadaStream : AudioStreamPlayer2D
@export var VoiceStream : AudioStreamPlayer2D
@export var MusicStream : AudioStreamPlayer2D

@export var debug : bool

var VoiceSyntheseBank = {}
var VoiceBank = {}

var OST = preload("res://Audio/Music/OST.ogg")


#Good
var GoodFil = preload("res://Audio/Voice/Bien/GoodDoigt.ogg")
var GoodJack = preload("res://Audio/Voice/Bien/GoodExp.ogg")
var GoodMieux = preload("res://Audio/Voice/Bien/Ca va mieux.ogg")
var Goodpeche = preload("res://Audio/Voice/Bien/J'ai la peche.ogg")
var GoodOui = preload("res://Audio/Voice/Bien/Oh Oui.ogg")
var GoodWesh = preload("res://Audio/Voice/Bien/Wesh ma gueule.ogg")

#Bad
var BadFil = preload("res://Audio/Voice/Pas bien/BadContact.ogg")
var BadBouton = preload("res://Audio/Voice/Pas bien/BadDef.ogg")
var BadEnceinte = preload("res://Audio/Voice/Pas bien/BadEspa.ogg")
var BadCable_alu = preload("res://Audio/Voice/Pas bien/BadPort.ogg")
var BadGpu = preload("res://Audio/Voice/Pas bien/BadTerm (1).ogg")
var BadRam = preload("res://Audio/Voice/Pas bien/BadVirus.ogg")

#Idle
var IdleDEFRAG = preload("res://Audio/Voice/Idle/IdleFRAG.ogg")
var IdleIE = preload("res://Audio/Voice/Idle/IdleIE.ogg")
var IdleUpdate = preload("res://Audio/Voice/Idle/IdleUpdate.ogg")
var IdleVlc = preload("res://Audio/Voice/Idle/IdleVLC (1).ogg")
#//Synthese Idle
var IdleDepeche = preload("res://Audio/Voice/Pas bien/Depeche.ogg")
var IdlePas_partir = preload("res://Audio/Voice/Pas bien/Je ne veux pas partir.ogg")
var IdleSens_le_cloud = preload("res://Audio/Voice/Pas bien/Je sens le cloud.ogg")
var IdleLaisse_pas = preload("res://Audio/Voice/Pas bien/Ne me laisse pas.ogg")
var IdleAdieu = preload("res://Audio/Voice/Pas bien/Adieu monde cruel.ogg")
var IdleAide_Moi = preload("res://Audio/Voice/Pas bien/Aide-moi.ogg")
var IdleJe_Pars = preload("res://Audio/Voice/Pas bien/Ca y est je pars.ogg")
var IdleFais_qqchose = preload("res://Audio/Voice/Pas bien/Fais quelque chose.ogg")
var IdleGingle_Netflix = preload("res://Audio/Voice/Pas bien/Gingle Netflix.ogg")
var IdleMal = preload("res://Audio/Voice/Pas bien/J'ai Mal.ogg")
var IdlePire = preload("res://Audio/Voice/Pas bien/Pire.ogg")

func _playAtInput() -> void:
	if Input.is_action_pressed("TestSon") :
		_playVoiceLine("Pire")
		
func _changeClipAtInput(plusOne : int) :
	if Input.is_action_pressed("ChangeSon") :
		print("Son Changer")
		
		
		
#Methodes 
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
	
	
func _musicPlay() -> void :
	MusicStream.play()
	
func _musicStop() -> void :
	MusicStream.stop()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VoiceSyntheseBank["GoodMieux"] = GoodMieux
	VoiceSyntheseBank["Goodpeche"] = Goodpeche
	VoiceSyntheseBank["GoodOui"] = GoodOui
	VoiceSyntheseBank["GoodWesh"] = GoodWesh
	VoiceSyntheseBank["IdleAdieu"] = IdleAdieu
	VoiceSyntheseBank["IdleAide_Moi"] = IdleAide_Moi
	VoiceSyntheseBank["IdleJe_Pars"] = IdleJe_Pars
	VoiceSyntheseBank["IdlePire"] = IdlePire 
	VoiceSyntheseBank["IdleGingle_Netflix"] = IdleGingle_Netflix
	VoiceSyntheseBank["IdleMal"] = IdleMal
	VoiceSyntheseBank["IdleDepeche"] = IdleDepeche
	VoiceSyntheseBank["IdleFais_qqchose"] = IdleFais_qqchose
	VoiceSyntheseBank["IdlePas_partir"] = IdlePas_partir
	VoiceSyntheseBank["IdleSens_le_cloud"] = IdleSens_le_cloud
	VoiceSyntheseBank["IdleLaisse_pas"] = IdleLaisse_pas
	
	
	VoiceBank["IdleDEFRAG"] = IdleDEFRAG
	VoiceBank["IdleIE"] = IdleIE
	VoiceBank["IdleUpdate"] = IdleUpdate
	VoiceBank["IdleVlc"] = IdleVlc
	
	VoiceBank["BadFil"] = BadFil
	VoiceBank["BadBouton"] = BadBouton
	VoiceBank["BadEnceinte"] = BadEnceinte
	VoiceBank["BadCable_alu"] = BadCable_alu
	VoiceBank["BadGpu"] = BadGpu
	VoiceBank["BadRam"] = BadRam
	
	VoiceBank["GoodFil"] = GoodFil
	VoiceBank["GoodJack"] = GoodJack
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if debug :
		_playAtInput()

func _playVoiceLine(voiceBankKey : String) -> void :
	VoiceStream.stream = VoiceBank[voiceBankKey]
	VoiceStream.play()
	
func _playSynthVoiceLine(synthVoiceBankKey : String) -> void : 
	VoiceStream.stream = VoiceSyntheseBank[synthVoiceBankKey]
	VoiceStream.play()
	
	
	
