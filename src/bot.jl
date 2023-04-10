abstract type AbstractBot end

name(bot::AbstractBot) = bot.name

token(bot::AbstractBot) = bot.token

url(bot::AbstractBot) = bot.url

api_version(bot::AbstractBot) = bot.api_version

api_endpoint(bot::AbstractBot) = "$(url(bot))/api/$(api_version(bot))"

channels(bot::AbstractBot) = bot.channels

channel(bot::AbstractBot, channel_name::String) = channels(bot)[channel_name]

modules(bot::AbstractBot) = bot.modules

function start(bot::AbstractBot)
    for (module_name, m) in modules(bot)
        @info "\tStarting module $module_name on bot $(name(bot))"
        start(m)
    end
end
