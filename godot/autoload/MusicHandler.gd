extends Node2D


var song_name = ""
var song_composer = ""
var previous_song : AudioStream
var song_path : AudioStream


onready var song : AudioStreamPlayer = $AudioStreamPlayer


func _process(_delta) -> void:
	if not song.stream == song_path:
		song.stream = song_path
		song.play()


func _on_AudioStreamPlayer_finished() -> void:
	song.playing = true
