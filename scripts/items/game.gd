extends Node2D

@onready var json:JSON=JSON.new()
@onready var file

func loadJson(path):
	if not FileAccess.file_exists(path):
		DialogInfo.make('ERROR','File not found')
		return
	file=FileAccess.open(path,FileAccess.READ)
	json.parse(file.get_as_text())
	DialogInfo.make('JSON',file.get_as_text())
func loadTiles(data:JSON):
	var manifest:JSON=data.get('manifest')
	if manifest['world']['world'] == 0:
		DialogInfo.make('a','b')
func loadTilesDefault():
	var manifest:JSON=json.get('manifest')
	if manifest['world']['world'] == 0:
		DialogInfo.make('a','b')
