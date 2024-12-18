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

var bloquant = false

var VoiceSyntheseBank = {}
var VoiceBank = {}

var OST = preload("res://Audio/Music/OST.ogg")
var IntroPreDL = preload("res://Audio/Voice/IntroOutro/IntroPreDl.ogg")
var IntroDL = preload("res://Audio/Voice/IntroOutro/IntroDL.mp3")
var IntroPostDL = preload("res://Audio/Voice/IntroOutro/IntroPostDL.ogg")
var VoiceOutroBad = preload("res://Audio/Voice/IntroOutro/OutroBad.ogg")
var VoiceOutroGood = preload("res://Audio/Voice/IntroOutro/OutroGood.ogg")

#Good
var GoodFil = preload("res://Audio/Voice/Bien/GoodDoigt.ogg")
var GoodCable_alu = preload("res://Audio/Voice/Bien/GoodCable_alu.ogg")
var GoodBouton = preload("res://Audio/Voice/Bien/GoodBouton.ogg")
var GoodGrille = preload("res://Audio/Voice/Bien/GoodGrille.ogg")
var GoodRam = preload("res://Audio/Voice/Bien/GoodRam.ogg")
var GoodEnceinte = preload("res://Audio/Voice/Bien/GoodEnceinte.ogg")
var GoodGpu = preload("res://Audio/Voice/Bien/GoodGpu.ogg")
var GoodVentilo = preload("res://Audio/Voice/Bien/GoodVentilo.ogg")
var GoodDessous_de_plat = preload("res://Audio/Voice/Bien/GoodDessous_de_plat.ogg")
var GoodJack = preload("res://Audio/Voice/Bien/GoodJack.ogg")
#GoodSynthese
var GoodMieux = preload("res://Audio/Voice/Bien/Ca va mieux.ogg")
var Goodpeche = preload("res://Audio/Voice/Bien/J'ai la peche.ogg")
var GoodOui = preload("res://Audio/Voice/Bien/Oh Oui.ogg")
var GoodWesh = preload("res://Audio/Voice/Bien/Wesh ma gueule.ogg")

#Bad
var BadCable_alu = preload("res://Audio/Voice/Pas bien/BadPort.ogg")
var BadFil = preload("res://Audio/Voice/Pas bien/BadFil.ogg")
var BadRam = preload("res://Audio/Voice/Pas bien/BadRam.ogg")
var BadBouton = preload("res://Audio/Voice/Pas bien/BadBouton.ogg")
var BadGpu = preload("res://Audio/Voice/Pas bien/BadTerm (1).ogg")
var BadEnceinte = preload("res://Audio/Voice/Pas bien/BadEspa.ogg")
var BadVentilo = preload("res://Audio/Voice/Pas bien/BadVentilo.ogg")
var BadDessous_De_Plat = preload("res://Audio/Voice/Pas bien/BadDessous_de_plat.ogg")
var BadGrille = preload("res://Audio/Voice/Pas bien/BadGrille.ogg")
var BadCable_alu2 = preload("res://Audio/Voice/Pas bien/BadCable_alu2.ogg")
var BadJack = preload("res://Audio/Voice/Pas bien/BadCable_alu.ogg")


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
		_playVoiceLine("Pire",true)
		
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
	
	VoiceBank["IntroPreDL"] = IntroPreDL
	VoiceBank["IntroDL"] = IntroDL
	VoiceBank["IntroPostDL"] = IntroPostDL
	
	VoiceBank["VoiceOutroBad"] = VoiceOutroBad
	VoiceBank["VoiceOutroGood"] = VoiceOutroGood
	
	VoiceBank["GoodFil"] = GoodFil
	VoiceBank["GoodCable_alu"] = GoodCable_alu
	VoiceBank["GoodBouton"] = GoodBouton
	VoiceBank["GoodGrille"] = GoodGrille
	VoiceBank["GoodRam"] = GoodRam
	VoiceBank["GoodEnceinte"] = GoodEnceinte
	VoiceBank["GoodGpu"] = GoodGpu
	VoiceBank["GoodVentilo"] = GoodVentilo
	VoiceBank["GoodDessous_de_plat"] = GoodDessous_de_plat
	VoiceBank["GoodJack"] = GoodJack
	
	VoiceBank["BadCable_alu"] = BadCable_alu
	VoiceBank["BadFil"] = BadFil
	VoiceBank["BadRam"] = BadRam
	VoiceBank["BadBouton"] = BadBouton
	VoiceBank["BadGpu"] = BadGpu
	VoiceBank["BadEnceinte"] = BadEnceinte
	VoiceBank["BadVentilo"] = BadVentilo
	VoiceBank["BadDessous_De_Plat"] = BadDessous_De_Plat
	VoiceBank["BadGrille"] = BadGrille
	VoiceBank["BadCable_alu2"] = BadCable_alu2
	VoiceBank["BadJack"] = BadJack
	
	
	VoiceBank["IdleDEFRAG"] = IdleDEFRAG
	VoiceBank["IdleIE"] = IdleIE
	VoiceBank["IdleUpdate"] = IdleUpdate
	VoiceBank["IdleVlc"] = IdleVlc


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if debug :
		_playAtInput()

func _playVoiceLine(voiceBankKey : String, is_blocking : bool) -> void :
	VoiceStream.stream = VoiceBank[voiceBankKey]
	bloquant = is_blocking
	VoiceStream.play()
	
func _playSynthVoiceLine(synthVoiceBankKey : String, is_blocking : bool) -> void : 
	VoiceStream.stream = VoiceSyntheseBank[synthVoiceBankKey]
	bloquant = is_blocking
	VoiceStream.play()

func _on_voice_stream_finished() -> void:
	bloquant = false
