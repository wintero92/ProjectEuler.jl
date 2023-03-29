"""
    p001_naive(below::Integer=1000) -> Integer

Calculates the sum of all the multiples of 3 or 5 below `below` using a brute force approach.

# Arguments
- `below::Integer = 1000`: The maximum number to consider.

# Returns
- `result::Integer`: The sum of all multiples of 3 or 5 below `below`.
"""
function p001_naive(below::Integer=1000)::Integer
    result = 0
    for v in 1:below-1
        if v % 3 == 0 || v % 5 == 0
            result += v
        end
    end
    return result
end

"""
    p001_short_1(below::Integer=1000) -> Integer

Calculates the sum of all the multiples of 3 or 5 below `below` using a shorter version of the brute force approach.

# Arguments:
- `below::Integer = 1000`: The maximum number to consider.

# Returns:
- `result::Integer`: The sum of all multiples of 3 or 5 below `below`.
"""
p001_short_1(below=1000) = sum(v % 3 == 0 || v % 5 == 0 ? v : 0 for v in 1:below-1)


"""
    p001_short_2(below::Integer=1000) -> Integer

Calculates the sum of all the multiples of 3 or 5 below `below` using a list comprehension.

# Arguments:
- `below::Integer = 1000`: The maximum number to consider.

# Returns:
- `result::Integer`: The sum of all multiples of 3 or 5 below `below`.
"""
p001_short_2(below=1000) = sum([i for i in 1:below-1 if i % 3 == 0 || i % 5 == 0])

"""
    _sum_divisible(multiple::Integer, divisor::Integer) -> Integer

Calculate the sum of all integers that are divisible by a given `divisor` up to a given `multiple`,
using the arithmetic series formula.

# Arguments
- `multiple::Integer`: The upper limit of the range of integers to check (exclusive).
- `divisor::Integer`: The integer to check divisibility against.

# Returns
- `sum::Integer`: The sum of all integers in the range [1, `multiple`) that are divisible by `divisor`.
"""
function _sum_divisible(multiple::Integer, divisor::Integer)::Integer
    p = fld(multiple, divisor)
    return fld(divisor * (p * (p + 1)), 2)
end

"""
    p001_nice(below::Integer=1000) -> Integer

Calculates the sum of all the multiples of 3 or 5 below `below` using a more efficient mathematical approach.

# Arguments:
- `below::Integer = 1000`: The maximum number to consider.

# Returns:
- `result::Integer`: The sum of all multiples of 3 or 5 below `below`.
"""
function p001_nice(below=1000)
    return _sum_divisible(below - 1, 3) + _sum_divisible(below - 1, 5) - _sum_divisible(below - 1, 15)
end

realizations[1] = [
    ProjectEuler.p001_naive,
    ProjectEuler.p001_short_1,
    ProjectEuler.p001_short_2,
    ProjectEuler.p001_nice
]