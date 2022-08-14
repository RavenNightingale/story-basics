env.importPaths = file.readLines("/usr/data/imports.conf")

for i in range(0,7)
	if displayMode.str(display(i).mode) != "off" then display(i).mode = displayMode.off
end for

text.install 0

import "objectModules"
import "autoReboot"

desktop = new objectModules.desktop

desktop.load

autoReboot.grabMsFiles file.curdir

while true
	autoReboot.checkForUpdates file.curdir
	for i in desktop.sprite_layer.sprites
		if i.contains(mouse) and mouse.button then

			i.loadMenu(objectModules.start, desktop)
		end if
	end for
	yield
end while