extends Area2D
class_name Goal

@export
var signal_helper: SignalHelper
@export
var goal_key: String

func _on_area_entered(area):
	signal_helper.emit_goal_for_key(goal_key)
