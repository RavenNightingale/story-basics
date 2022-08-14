env.importPaths = file.readLines("/usr/data/imports.conf")

for i in range(0,7)
	if displayMode.str(display(i).mode) != "off" then display(i).mode = displayMode.off
end for

text.install 0

import "mainInt"
import "startInt"

desktop = new mainInt.desktop
start_background = new startInt.start

desktop.load

while true
	for i in desktop.sprite_layer.sprites
		if i.contains(mouse) and mouse.button then
			i.loadMenu(start_background)
		end if
	end for
	yield
end while