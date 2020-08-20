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

        --[[
            Select all rows from accounts:
            local row = dbConnection:query("SELECT * FROM `accounts`")

            We can see the output:
            logInfo(tostring(inspect(row)))
            OUTPUT:
            {
                id = 1,
                username = "cleopatra",
                mail = "blablabla@blabla.com",
                password = "123456",
                socialClub = "cleopatra"
            }

            Select ID:1 row from accounts:
            local row = dbConnection:query("SELECT * FROM `accounts` WHERE id=?", 1)

            Another Examples:
            dbConnection:query("SELECT 2020, ?", "Hello World")
            dbConnection:query("SELECT :example, :hello", {[":example"] = 2020, [":hello"] = "Hello World"})
        ]]--
        
        
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
