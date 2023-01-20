extends Node
class_name BasicGameController

@export
var signalHelper : SignalHelper


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func on_goal(goalArea: Goal):
	signalHelper.emit_goal_for_key(goalArea.goal_key)
