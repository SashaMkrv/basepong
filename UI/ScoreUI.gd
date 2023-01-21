@tool
extends MarginContainer
class_name ScoreUI

@onready
var player_name_label : Label = $VBoxContainer/TeamLabel
@onready
var score_label : Label = $VBoxContainer/ScoreLabel

@export
var player_data : PlayerData :
	set(new_data):
		connect_and_disconnect_old(player_data, new_data)
		player_data = new_data
		if not player_data == null: 
			update_ui()

func connect_and_disconnect_old(old_data : PlayerData, new_data : PlayerData):
	if not old_data == null:
		old_data.name_updated.disconnect(update_name)
		old_data.score_updated.disconnect(update_score)
	if not new_data == null:
		new_data.name_updated.connect(update_name)
		new_data.score_updated.connect(update_score)

func _ready():
	update_ui()

func update_ui():
	set_player_name(player_data.player_name)
	set_score(player_data.score)

func update_name(_old_name, new_name : String):
	set_player_name(new_name)

func set_player_name(player_name):
	if player_name_label == null:
		return
	player_name_label.text = player_name
	
func update_score(_old_score, new_score : int):
	set_score(new_score)

func set_score(score):
	if score_label == null:
		return
	score_label.text = str(score)
