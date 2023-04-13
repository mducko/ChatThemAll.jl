struct HubState
    concurrencies::Dict{String,Set{String}}
    dependencies::Dict{String,Set{String}}
    initialized::Dict{String,Base.Event}
    running::Dict{String,Base.Event}

    function HubState()
        return new(
            Dict{String,Set{String}}(),
            Dict{String,Set{String}}(),
            Dict{String,Base.Event}(),
            Dict{String,Base.Event}()
        )
    end
end

concurrencies(state::HubState) = state.concurrencies
function concurrencies(state::HubState, module_name::String)
    return get(concurrencies(state), module_name, Set{String}())
end

dependencies(state::HubState) = state.dependencies
function dependencies(state::HubState, module_name::String)
    return get(dependencies(state), module_name, Set{String}())
end

initialized(state::HubState) = state.initialized
initialized!(state::HubState, name) = get!(initialized(state), name, Base.Event())

running(state::HubState) = state.running
running!(state::HubState, name) = get!(running(state), name, Base.Event())

function wait_dependencies(state::HubState, module_name::String)
    foreach(d -> wait(initialized!(state, d)), dependencies(state, module_name))
end

function wait_concurrencies(state::HubState, module_name::String)
    foreach(c -> wait(running!(state, c)), concurrencies(state, module_name))
end

function is_initialized(state::HubState, module_name::String)
    return notify(initialized!(state, module_name))
end
function add!(
    state::HubState,
    module_name::String,
    concurrents::Set{String},
    depends_on::Set{String}
)
    push!(concurrencies(state), module_name => concurrents)
    push!(dependencies(state), module_name => depends_on)
    initialized!(state, module_name)
    running!(state, module_name)
end
