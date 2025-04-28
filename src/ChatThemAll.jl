module ChatThemAll

# SECTION - Imports
using Dates
using ModelingToolkit

# SECTION - Exports
# export token, url, api_version, api_endpoint, channels, channel

export BotsHub
export ListeningModule, ExecutingModule, MonitoringModule
# export ModuleCore

export add!

# SECTION - Includes
include("module.jl")
include("bot.jl")
include("state.jl")
include("hub.jl")

# Function to simulate interaction with timing and delay sequences
function simulate_interaction(interaction_time::Float64, delay_time::Float64)
    @parameters t
    @variables x(t)
    D = Differential(t)
    eqs = [D(x) ~ -x + interaction_time]
    sys = ODESystem(eqs)
    prob = ODEProblem(sys, [x => 0.0], (0.0, delay_time))
    sol = solve(prob, Tsit5())
    return sol
end

end
