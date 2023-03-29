"""
    p005_nice(n::Integer=20) -> Integer

Returns the smallest positive number that is evenly divisible by all the numbers from 1 to `n`.
Uses the `lcm` function to compute the least common multiple of all the integers from 1 to `n`.

# Arguments:
- `n::Integer`: the highest number to include in the computation (default: 20)

# Returns:
- `m::Integer`: the smallest positive number that is evenly divisible by all the numbers from 1 to `n`.
"""
function p005_nice(n::Integer=20)::Integer
    m::Int64 = 1
    for i in 1:n
        m = lcm(m, i)
    end
    return m
end

realizations[5] = [
    ProjectEuler.p005_nice
]
