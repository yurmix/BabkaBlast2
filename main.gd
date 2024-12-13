extends Node2D

var babka_scene = preload("res://Babka.tscn")
var score = 0
var babkas_remaining = 10  # Total number of Babkas to spawn
var current_babka = null

@onready var score_label = $ScoreLabel
@onready var game_over_label = $GameOverLabel

func _ready():
	spawn_babka()
	game_over_label.hide()

func spawn_babka():
	if babkas_remaining <= 0:
		game_over()
		return
		
	current_babka = babka_scene.instantiate()
	add_child(current_babka)
	current_babka.position = Vector2(
		randf_range(50, get_viewport_rect().size.x - 50),
		-50  # Start above screen
	)
	current_babka.connect("clicked", on_babka_clicked)
	current_babka.connect("missed", on_babka_missed)
	babkas_remaining -= 1

func on_babka_clicked():
	score += 1
	score_label.text = "Score: " + str(score)
	spawn_babka()

func on_babka_missed():
	spawn_babka()

func game_over():
	game_over_label.text = "Game Over!\nFinal Score: " + str(score)
	game_over_label.show()
