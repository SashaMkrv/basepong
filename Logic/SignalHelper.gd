extends Node
class_name SignalHelper

signal goal_signal(goal: Goal)
func emit_goal_signal(goal: Goal):
	emit_signal("goal_signal", goal)

signal goal_for_key(key: String)
func emit_goal_for_key(key: String):
	emit_signal("goal_for_key", key)
