extends Panel

func setOnClick(fun):
	$SelectableButton.setOnClick(fun)
func setDisabled(s:bool):
	if s:
		self["theme_override_styles/panel"]["bg_color"]=Color.WEB_GRAY
		$SelectableButton.visible=false
	else:
		self["theme_override_styles/panel"]["bg_color"]=Color.WHITE
		$SelectableButton.visible=true
