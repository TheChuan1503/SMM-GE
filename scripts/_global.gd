extends Node

@onready var lang=OS.get_locale_language()
const isDebug = true
const COLOR_YELLOW = Color('fecc00')
const COLOR_RED = Color('5a1010')
var scene = 'start'

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
func i18n(label:Label):
	var text=label.text
	if FileAccess.file_exists('res://lang/'+lang+'.json'):
		var json=JSON.new()
		json.parse(FileAccess.open('res://lang/'+lang+'.json',FileAccess.READ).get_as_text())
		if not json.data.has(text):
			print('not has '+text)
		else:
			label.text=json.data[text]
	else:
		var defLang = FileAccess.open('res://lang/_default.txt',FileAccess.READ).get_as_text()
		var json=JSON.new()
		json.parse(FileAccess.open('res://lang/'+defLang+'.json',FileAccess.READ).get_as_text())
		if not json.data.has(text):
			print('not has '+text)
		else:
			label.text=json.data[text]
