using ProjectEuler
using Test
using Printf
using BenchmarkTools

@testset "common.jl" begin
    include("common_test.jl")
end

include("solutions.jl")

problems_solved = 4

@testset "ProjectEuler.jl" begin
    for p in 1:problems_solved
        @testset "Problem $p" begin
            for realization in realizations[p]
                @test realization() == solutions[p]
            end
        end
    end
end

function _print_name(f, max_len)
    len = length(string(f))
    return len < max_len ? string(f) * " "^(max_len - len) : string(f)
end

function _print_benchmarks(functions, times)
    max_len = maximum([length(string(fun)) for fun in functions])
    for v in sortperm(times)
        @printf("\t%s:%16.5f\n", _print_name(functions[v], max_len), times[v])
    end
end

for p in 1:problems_solved
    println("Problem $p")
    times = Float64[]
    for realization in realizations[p]
        t = @benchmark $realization()
        push!(times, mean(t.times))
    end
    _print_benchmarks(realizations[p], times)
end

println()