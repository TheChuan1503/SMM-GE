extends CanvasLayer
@onready var coin_label: Label = $TextureRect/coinLabel

func _process(delta: float) -> void:
	coin_label.text = Global.fillZero(GameStatus.coin,2)
