--[[
    *require("mysql")
    Description: In order to use the MySQL module, we require it into the lua file.
]]--
local mysql = require("mysql")

--[[
    *local settings*
    Description: Here, a table has been opened for you to configure your MySQL settings.
]]--
local settings = {
    host = "",
    user = "",
    password = "",
    database = "",
    port = 3306
}

--[[
    *alt.on("resourceStart")
    Description: The following codes run when the resource is fully started.
]]--

alt.on("resourceStart",
    function()
        --[[
            *mysql:connect
            Descrption: We connect to MySQL db with this function.
        ]]--
        dbConnection = mysql:connect(settings.host, settings.user, settings.password, settings.database, settings.port)
    end
)

alt.on("resourceStop",
    function()
         --[[
            *dbConnect:close
            Descrption: We disconnect because we're done.
        ]]--
        dbConnection:close()
    end
)