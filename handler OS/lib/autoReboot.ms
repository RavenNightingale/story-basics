grabMsFiles = function(path)
    for i in file.children(path)
        snaggedFile = file.info(path + "/" + i)
        if snaggedFile.isDirectory then grabMsFiles(snaggedFile.path)
        if not file.name(path + "/" + i).indexOf(".ms") then continue
        foundFile = new moduleData
        data = file.open(path + "/" + i, "r")
        foundFile.name = i
        foundFile.data = data.read
        data.close
        msFiles.push foundFile
    end for
end function

checkForUpdates = function(path)
    for i in file.children(path)
        snaggedFile = file.info(path + "/" + i)
        if snaggedFile.isDirectory then checkForUpdates(snaggedFile.path)
        if not file.name(path + "/" + i).indexOf(".ms") then continue
        for msfile in msFiles
            if msfile.name == file.name(path + "/" + i) then
                data = file.open(path + "/" + i, "r")
                dataContent = data.read 
                data.close
                if msfile.data != dataContent then reboot
            end if
        end for
    end for
end function

moduleData = {}
moduleData.name = ""
moduleData.data = ""

msFiles = []