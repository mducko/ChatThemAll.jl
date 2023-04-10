abstract type AbstractModule end

abstract type ListeningModule <: AbstractModule end

abstract type MonitoringModule <: AbstractModule end

abstract type ExecutionModule <: AbstractModule end

start(::AbstractModule) = nothing

start(m::ListeningModule) = listen(m)

start(m::MonitoringModule) = monitor(m)

start(m::ExecutionModule) = execute(m)
