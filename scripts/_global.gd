extends Node

const isDebug = true;

func getTileIndex(world:String, id:String):
	var json:JSON=JSON.new()
	json.parse(FileAccess.open('res://objects_tables/'+world+'.json',FileAccess.READ).get_as_text())
	return json.data[id]
# 定义一个函数用于获取路径
func getExDir() -> String:
	var os_name = OS.get_name()
	if os_name == "Android":
		DirAccess.open("/storage/emulated/0/").make_dir("SMM_GE/");
		return "/storage/emulated/0/SMM_GE/"
	else:
		return OS.get_data_dir()
func getLevelsDir() -> String:
	DirAccess.open(getExDir()).make_dir('levels/');
	return getExDir()+'/levels/'
