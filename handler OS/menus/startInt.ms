start = {}

start.color = "#303737FF"

start.load = function(targetDisplay)
    if targetDisplay.mode == 3 then
        targetDisplay.fillRect 0, 40, 480, 110, self.color
    end if
end function