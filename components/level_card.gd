extends Control

func init(name:String):
	var json:JSON = JSON.new()
	json.parse(FileAccess.open(Global.getLevelsDir()+'/'+name,FileAccess.READ).get_as_text())
	var data:Dictionary = json.data['manifest']
	$Panel/ColorRect/Label.text=data['title']
	$SelectableButton.setOnClick(fun.bind(data))
func fun(data):
	LevelInfo.make(data)
	$AudioStreamPlayer.play()
