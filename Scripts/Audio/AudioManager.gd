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

var ca_va_mieux = preload("res://Audio/Voice/Bien/Ca va mieux.ogg")
var peche = preload("res://Audio/Voice/Bien/J'ai la peche.ogg")
var oh_oui = preload("res://Audio/Voice/Bien/Oh Oui.ogg")
var wesh = preload("res://Audio/Voice/Bien/Wesh ma gueule.ogg")

var GoodDoigt = preload("res://Audio/Voice/Bien/GoodDoigt.ogg")
var GoodExp = preload("res://Audio/Voice/Bien/GoodExp.ogg")

var adieu = preload("res://Audio/Voice/Pas bien/Adieu monde cruel.ogg")
var aide_moi = preload("res://Audio/Voice/Pas bien/Aide-moi.ogg")
var je_pars = preload("res://Audio/Voice/Pas bien/Ca y est je pars.ogg")
var gingle_netflix = preload("res://Audio/Voice/Pas bien/Gingle Netflix.ogg")
var mal = preload("res://Audio/Voice/Pas bien/J'ai Mal.ogg")
var pire = preload("res://Audio/Voice/Pas bien/Pire.ogg")
var BadContact = preload("res://Audio/Voice/Pas bien/BadContact.ogg")
var BadDef = preload("res://Audio/Voice/Pas bien/BadDef.ogg")
var BadEspa = preload("res://Audio/Voice/Pas bien/BadEspa.ogg")
var BadPort = preload("res://Audio/Voice/Pas bien/BadPort.ogg")
var BadTerm = preload("res://Audio/Voice/Pas bien/BadTerm (1).ogg")
var BadVirus = preload("res://Audio/Voice/Pas bien/BadVirus.ogg")

var depeche = preload("res://Audio/Voice/Pas bien/Depeche.ogg")
var pas_partir = preload("res://Audio/Voice/Pas bien/Je ne veux pas partir.ogg")
var fais_qqchose = preload("res://Audio/Voice/Pas bien/Fais quelque chose.ogg")
var sens_le_cloud = preload("res://Audio/Voice/Pas bien/Je sens le cloud.ogg")
var laisse_pas = preload("res://Audio/Voice/Pas bien/Ne me laisse pas.ogg")

var IdleDEFRAG = preload("res://Audio/Voice/Idle/IdleFRAG.ogg")
var IdleE = preload("res://Audio/Voice/Idle/IdleIE.ogg")
var IdleUpdate = preload("res://Audio/Voice/Idle/IdleUpdate.ogg")
var IdleVlc = preload("res://Audio/Voice/Idle/IdleVLC (1).ogg")


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
	
	
func _musicPlay() -> void :
	MusicStream.play()
	
func _musicStop() -> void :
	MusicStream.stop()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VoiceSyntheseBank["GoodMieux"] = ca_va_mieux
	VoiceSyntheseBank["Goodpeche"] = peche
	VoiceSyntheseBank["GoodOui"] = oh_oui
	VoiceSyntheseBank["GoodWesh"] = wesh
	VoiceSyntheseBank["BadAdieu"] = adieu
	VoiceSyntheseBank["BadAide"] = aide_moi
	VoiceSyntheseBank["BadPars"] = je_pars
	VoiceSyntheseBank["BadPire"] = pire 
	VoiceSyntheseBank["BadGingle"] = gingle_netflix
	VoiceSyntheseBank["BadMal"] = mal
	VoiceSyntheseBank["IdleDepeche"] = depeche
	VoiceSyntheseBank["IdleFaisquelquechose"] = fais_qqchose
	VoiceSyntheseBank["IdlePasPartir"] = pas_partir
	VoiceSyntheseBank["IdleCloud"] = sens_le_cloud
	VoiceSyntheseBank["IdleLaissePas"] = laisse_pas
	
	
	
	VoiceBank["IdleDEFRAG"] = IdleDEFRAG
	VoiceBank["IdleE"] = IdleE
	VoiceBank["IdleUpdate"] = IdleUpdate
	VoiceBank["IdleVlc"] = IdleVlc
	
	VoiceBank["BadContact"] = BadContact
	VoiceBank["BadDef"] = BadDef
	VoiceBank["BadEspa"] = BadEspa
	VoiceBank["BadPort"] = BadPort
	VoiceBank["BadTerm"] = BadTerm
	VoiceBank["BadVirus"] = BadVirus
	
	VoiceBank["GoodDoigt"] = GoodDoigt
	VoiceBank["GoodExp"] = GoodExp
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if debug :
		_playAtInput()

func _playVoiceLine(voiceBankKey : String) -> void :
	VoiceStream.stream = VoiceBank[voiceBankKey]
	VoiceStream.play()
	
	
	
