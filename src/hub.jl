struct BotHub
    bots::Dict{String,AbstractBot}
    modules::Dict{Symbol,AbstractModule}

    function BotHub(;
        bots=Dict{String,AbstractBot}(),
        modules=Dict{Symbol,AbstractModule}()
    )
        return new(bots, modules)
    end
end

bots(hub::BotHub) = hub.bots

function listen(hub::BotHub) end

function monitor(hub::BotHub) end

function execute(hub::BotHub) end

function start(hub::BotHub)
    @info "Starting hub modules"
    for (module_name, m) in modules(hub)
        @info "\tStarting module $module_name"
        start(m)
    end
    for (bot_name, bot) in bots(hub)
        @info "Starting bot $bot_name"
        start(bot)
    end
end
