extends CanvasLayer


func btn_new_game():
	G.score = 0
	get_tree().change_scene("res://FirstScene.tscn")
	
func btn_exit():
	get_tree().quit()
	

func _ready():
	$ColorRect/NewGame.connect('pressed', self, "btn_new_game")
	$ColorRect/Exit.connect("pressed", self, "btn_exit")
	

