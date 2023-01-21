@tool
extends Resource
class_name PlayerData

signal name_updated(old_name : String, new_name : String)
@export
var player_name : String :
	set(new_name):
		name_updated.emit(player_name, new_name)
		player_name = new_name
		print_debug("new name %s", new_name)

signal score_updated(old_score : int, new_score : int)
@export
var score : int :
	set(new_score):
		score_updated.emit(score, new_score)
		score = new_score
		print_debug("new score %s", new_score)
