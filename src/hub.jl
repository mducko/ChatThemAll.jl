struct BotsHub
    bots::Dict{String,AbstractBot}
    modules::Dict{String,AbstractModule}
    state::HubState

    function BotsHub()
        return new(
            Dict{String,AbstractBot}(),
            Dict{String,AbstractModule}(),
            HubState()
        )
    end
end

bots(hub::BotsHub) = hub.bots

modules(hub::BotsHub) = hub.modules

state(hub::BotsHub) = hub.state

add!(hub::BotsHub, bot::AbstractBot) = push!(bots(hub), name(bot) => bot)

function add!(
    hub::BotsHub,
    m::AbstractModule;
    concurrents::Set{String}=Set{String}(),
    depends_on::Set{String}=Set{String}()
)
    push!(modules(hub), name(m) => m)
    add!(state(hub), name(m), concurrents, depends_on)
end

function start!(hub::BotsHub, log_path=joinpath(pwd(), "log"))
    d = now(UTC)
    @info "[$d] Starting hub with bots"
    mkpath(log_path)
    path = joinpath(log_path, "$d.log")
    f = open(path, "a")
    foreach(bot -> println("\t\t• $bot"), collect(keys(bots(hub))))
    println("\n\tStarting modules")
    @sync for (module_name, m) in modules(hub)
        @async begin
            wait_dependencies(state(hub), module_name)
            d = now(UTC)
            println("\t\t• $module_name [$d]")
            write(f, "[$d] start init $module_name\n")
            schedule(init(m))
            is_initialized(state(hub), module_name)
            write(f, "[$d] end init $module_name\n")
            simulate_interaction(1.0, 0.5)
        end
    end
    close(f)
end
