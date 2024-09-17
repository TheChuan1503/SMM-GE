extends Control

func init(name:String):
	var json:JSON = JSON.new()
	json.parse(FileAccess.open(Global.getLevelsDir()+'/'+name,FileAccess.READ).get_as_text())
	var data:Dictionary = json.data['manifest']
	$Panel/TextureRect.texture=load("res://src/images/game_bg/"+data['world']['type']+"_"+data['world']['world']+".png")
	$Panel/ColorRect/Label.text=data['title']
	$SelectableButton.setOnClick(fun.bind(name,data))
func fun(name,data):
	LevelInfo.make(name,data)
	$AudioStreamPlayer.play()
