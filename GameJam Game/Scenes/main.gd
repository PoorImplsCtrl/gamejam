extends Node

var TOTAL_MINES : int = 30
var time_elapsed : float
var mines_left : int
var first_click : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	first_click = true
	time_elapsed = 0
	mines_left = TOTAL_MINES
	$TileMap2.new_game()
	$GameOver.hide()
	get_tree().paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed += delta
	$HUD.get_node("Stopwatch").text = str(int(time_elapsed))
	$HUD.get_node("MinesLeft").text = str(mines_left)

func end_game(result):
	get_tree().paused = true
	$GameOver.show()
	if result == 1:
		$GameOver.get_node("Label").text = "YOU WIN!"
	else:
		$GameOver.get_node("Label").text = "RIP"

func _on_tile_map_2_flag_placed():
	mines_left -= 1

func _on_tile_map_2_flag_removed():
	mines_left += 1

func _on_tile_map_2_win_game():
	end_game(1)

func _on_tile_map_2_end_game():
	end_game(-1)

func _on_game_over_restart():
	new_game()

func _on_game_over_hardmode():
	TOTAL_MINES = 60

func _on_game_over_easymode():
	TOTAL_MINES = 30
