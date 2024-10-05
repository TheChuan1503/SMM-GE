extends Control

func init(name:String):
	var data:Dictionary = Global.getLevelData(name)['manifest']
	$Panel/TextureRect.texture=load("res://src/images/game_bg/"+data['world']['type']+"_"+data['world']['world']+".png")
	$Panel/ColorRect/Label.text=data['title']
	$SelectableButton.setOnClick(fun.bind(name,data))
func fun(name,data):
	LevelInfo.make(name,data)
	$AudioStreamPlayer.play()
