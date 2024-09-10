extends Node

const isDebug = true;

func getTileIndex(world:String, id:String):
	var json:JSON=JSON.new()
	json.parse(FileAccess.open('res://objects_tables/'+world+'.json',FileAccess.READ).get_as_text())
	return json.data[id]
