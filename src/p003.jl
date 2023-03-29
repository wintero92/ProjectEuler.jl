include("common.jl")

"""
    p003_naive(value::Integer=600_851_475_143) -> Integer

Naive implementation of the algorithm. Iterates through all odd numbers from 3 up to the square root of the value
and checks if each one is a factor and prime.

# Arguments
- `value::Integer = 600_851_475_143`: the number to find the largest prime factor of.

# Returns
- `max_divisor::Integer`: the largest prime factor of `value`
"""
function p003_naive(value::Integer=600_851_475_143)::Integer
    max_divisor = value % 2 == 0 ? 2 : 1
    divisor::Int64 = 3
    while divisor <= floor(Int, sqrt(value))
        if value % divisor == 0 && is_prime(divisor)
            max_divisor = divisor
        end
        divisor += 2
    end
    return max_divisor
end

"""
    p003_short(value::Integer=600_851_475_143) -> Integer

Calculates the largest prime factor of `value` using a more efficient algorithm. This function uses a while loop to divide the input value by increasingly larger odd divisors until it is reduced to 1. If a divisor is a factor of the input value, it updates the value to the result of dividing by the divisor and saves the divisor as the new last divisor. Once the loop has finished, the function returns the last divisor, which is the largest prime factor of the original input value.


# Arguments
- `value::Integer = 600_851_475_143`: the number to find the largest prime factor of

# Returns
- `max_divisor::Integer`: the largest prime factor of `value`
"""
function p003_short(value::Integer=600_851_475_143)::Integer
    divisor::Int64 = 3
    last_divisor::Int64 = 1
    while value > 1
        if value % divisor == 0
            last_divisor = divisor
            value = fld(value, divisor)
        end
        divisor += 2
    end
    return last_divisor
end

"""
    p003_nice(value::Integer=600_851_475_143) -> Integer

Calculates the largest prime factor of `value` using an efficient algorithm. Divides out all powers of 2 from the number until it becomes odd, and then checks for odd divisors up to the square root of the remaining value, dividing them out as it goes along.

# Arguments
- `value::Integer = 600_851_475_143`: The number to find the largest prime factor of.

# Returns
- `max_divisor::Integer`: The largest prime factor of `value`.
"""
function p003_nice(value::Integer = 600_851_475_143)::Integer
    while value % 2 == 0
        value = fld(value, 2)
    end
    divisor::Int64 = 3
    max_divisor = isqrt(value)
    while value > 1 && divisor <= max_divisor
        if value % divisor == 0
            value = fld(value, divisor)
            max_divisor = floor(Int, sqrt(value))
        end
        divisor += 2
    end
    return value
end

realizations[3] = [
    ProjectEuler.p003_naive,
    ProjectEuler.p003_short,
    ProjectEuler.p003_nice
]
