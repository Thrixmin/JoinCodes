
local HttpService = game:GetService("HttpService")
local request = request or syn.request
local HttpService = game:GetService("HttpService")
local Base64 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Thrixmin/JoinCodes/main/Base64.lua"))()

local Git = {}

function Git.Push(Repository, File, Content)
    local Url = "https://api.github.com/repos/" .. Repository  .. "/contents/" .. File

    return request({
        Url = Url,
        Method = "PUT",
        Headers = {
            ["Content-Type"] = "application/json", 
            ["Authorization"] = "token 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"
        },
        Body = HttpService:JSONEncode({
            message = "push", 
            content = Base64.Encode(Content), 
            sha = HttpService:JSONDecode(request({
                Url = Url, 
                Method = "GET", 
                Headers = {
                    ["Authorization"] = "token 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"
                }
            }).Body).sha
        })
    })
end

return Git
