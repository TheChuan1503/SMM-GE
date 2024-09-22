extends Control
@onready var virtual_background: TextureRect = $virtualBackground
@onready var own_courses_list: GridContainer = $ownCoursesList
@onready var level_count: Label = $levelCount
@onready var path_viewer: LineEdit = $pathViewer

func i18n():
	Global.i18n($head/title)
	Global.i18n($ColorRect/Panel/own)

func _on_bgm_finished() -> void:
	$bgm.play()
	pass # Replace with function body.
func getLevels():
	var l:Array = DirAccess.open(Global.getLevelsDir()).get_files()
	var rez:Array
	for e:String in l:
		if e.substr(e.length()-4).to_lower() == '.sge':
			rez.push_back(e)
	return rez
func _ready() -> void:
	Global.scene='coursebot'
	Global.isMaker=false
	i18n()
	path_viewer.text=Global.getLevelsDir()
	virtual_background.visible=false
	var levels:Array=getLevels()
	level_count.text=str(levels.size())
	for e in levels:
		var levelCard:=preload("res://components/levelCard.tscn").instantiate()
		levelCard.init(e)
		own_courses_list.add_child(levelCard)
