extends CanvasLayer
@onready var coin_label: Label = $TextureRect/coinLabel
@onready var time_label: Label = $TextureRect2/timeLabel

func _process(delta: float) -> void:
	coin_label.text = Global.fillZero(GameStatus.coin,2)
	time_label.text = Global.fillZero(GameStatus.time,3)
