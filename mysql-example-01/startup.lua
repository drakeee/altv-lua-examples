local mysql = require("mysql")
local settings = {
    host = "",
    user = "",
    password = "",
    database = "",
    port = 3306
}

alt.on("resourceStart",
    function()
        dbConnection = mysql:connect(settings.host, settings.user, settings.password, settings.database, settings.port)
    end
)