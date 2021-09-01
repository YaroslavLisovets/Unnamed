extends Node

var STEAM_ID: int = 0
var STEAM_USERNAME: String = ""
var STEAM_LOBBY_ID: int = 0
var LOBBY_MEMBERS: Array = []
var DATA
var LOBBY_INVITE_ARG: bool = false


func _ready() -> void:
	print(Steam.steamInit())

func _process(_delta: float) -> void:
	Steam.run_callbacks()
