using ChatThemAll
using Test

@testset "ChatThemAll.jl" begin
    # Write your tests here.
    @testset "simulate_interaction" begin
        interaction_time = 1.0
        delay_time = 0.5
        sol = simulate_interaction(interaction_time, delay_time)
        @test sol[end] ≈ interaction_time
    end
end
