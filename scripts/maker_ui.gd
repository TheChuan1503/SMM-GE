extends CanvasLayer
@onready var btn_eraser: Panel = $Panel/ColorRect2/BtnEraser
@onready var item_card_1: Control = $Panel2/ColorRect/ItemCard1
@onready var item_card_2: Control = $Panel2/ColorRect/ItemCard2
@onready var item_card_3: Control = $Panel2/ColorRect/ItemCard3
@onready var item_card_4: Control = $Panel2/ColorRect/ItemCard4
@onready var item_card_5: Control = $Panel2/ColorRect/ItemCard5
@onready var item_card_6: Control = $Panel2/ColorRect/ItemCard6
@onready var item_card_7: Control = $Panel2/ColorRect/ItemCard7
@onready var item_card_8: Control = $Panel2/ColorRect/ItemCard8
@onready var item_card_9: Control = $Panel2/ColorRect/ItemCard9
@onready var item_card_10: Control = $Panel2/ColorRect/ItemCard10
@onready var item_card_11: Control = $Panel2/ColorRect/ItemCard11
@onready var item_card_12: Control = $Panel2/ColorRect/ItemCard12


func _ready() -> void:
	MakerStatus.init()
	btn_eraser.setOnClick(eraser)
	item_card_1.setObject('block_soil')
	item_card_2.setObject('block_brick')
	item_card_3.setObject('item_coin')
	pass # Replace with function body.

func eraser():
	get_parent().setState('eraser')
	MakerStatus.isEraser = not MakerStatus.isEraser
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
