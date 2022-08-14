start = {}

start.color = "#303737FF"

start.load = function(targetDisplay)
    if targetDisplay.mode == 3 then
        targetDisplay.fillRect 0, 40, 480, 110, self.color
    end if
end function

//=================================
desktop = {} 
desktop.background = new SolidColorDisplay        
desktop.background.color = "#9FD1FFFF"     
//=================================
desktop.taskbar = new PixelDisplay             
desktop.taskbar.width = 960             // desktop taskbar
desktop.taskbar.height = 640             
desktop.taskbar.color = "#5EC2FFFF"      
//=================================
desktop.sprite_layer = new SpriteDisplay
//=================================
desktop.load = function() //desktop display
	

	self.background.install 3
	self.taskbar.install 1
	self.sprite_layer.install 2

	self.taskbar.color = "#5EC2FFFF" //temporary fix, change later!
	self.taskbar.clear color.clear
	self.taskbar.drawRect 4, 4, 953, 40, self.taskbar.color, 5
	self.taskbar.line 150, 3, 180, 20, self.taskbar.color, 5
	self.taskbar.line 150, 43, 180, 20, self.taskbar.color, 5

	start_button = new Sprite
	start_button.image = file.loadImage("/usr/menus/images/start_button.png")
	start_button.x = 77
	start_button.y = 23
	start_button.localBounds = new Bounds
	start_button.localBounds.width = start_button.image.width
	start_button.localBounds.height = start_button.image.height

	start_button.loadMenu = function(objectModule, parent)
		objectModule.load(parent.taskbar)
	end function

	self.sprite_layer.sprites.push start_button
end function


