abstract type AbstractModule end

struct EmptyModule <: AbstractModule end

init(::EmptyModule) = nothing

init(m::AbstractModule) = m.init

name(::EmptyModule) = "∅ module"

name(m::AbstractModule) = m.name

run(::EmptyModule) = nothing

run(m::AbstractModule) = m.run

# abstract type SpecModule end

struct ListeningModule <: AbstractModule
    init::Union{Task,Nothing}
    name::String
    run::Union{Task,Nothing}

    function ListeningModule(;
        init::Union{Task,Nothing}=nothing,
        name::String="Listening module",
        run::Union{Task,Nothing}=nothing
    )
        simulate_interaction(1.0, 0.5)
        return new(init, name, run)
    end
end

struct MonitoringModule <: AbstractModule
    init::Union{Task,Nothing}
    name::String
    run::Union{Task,Nothing}

    function MonitoringModule(;
        init::Union{Task,Nothing}=nothing,
        name::String="Monitoring module",
        run::Union{Task,Nothing}=nothing
    )
        simulate_interaction(1.0, 0.5)
        return new(init, name, run)
    end
end

struct ExecutionModule <: AbstractModule
    init::Union{Task,Nothing}
    name::String
    run::Union{Task,Nothing}

    function ExecutionModule(;
        init::Union{Task,Nothing}=nothing,
        name::String="Execution module",
        run::Union{Task,Nothing}=nothing
    )
        simulate_interaction(1.0, 0.5)
        return new(init, name, run)
    end
end
