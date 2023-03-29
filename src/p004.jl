include("common.jl")

"""
    p004_naive(digits=3::Integer) -> Integer

Find the largest palindrome made from the product of two n-digit numbers.
Returns 0 if no palindrome is found.

# Arguments
- `digits::Integer=3`: number of digits for the two numbers to be multiplied.

# Returns
- `largest_palindrome::Int64`: largest palindrome found, or 0 if no palindrome is found.
"""
function p004_naive(digits=3::Integer)::Integer
    a = 10^digits - 1
    largest_palindrome::Int64 = 0
    while a >= 10^(digits - 1)
        b = 10^digits - 1
        while b >= a
            if is_palindrome(a * b)
                largest_palindrome = max(largest_palindrome, a * b)
            end
            b -= 1
        end
        a -= 1
    end
    return largest_palindrome
end

"""
    p004_short(digits::Integer=3) -> Integer

Find the largest palindrome that can be obtained by multiplying two n-digit numbers.

# Arguments
- `digits::Integer=3`: The number of digits for each factor.

# Returns
- `result::Integer`: The largest palindrome that can be obtained by multiplying two n-digit numbers. Returns 0 if no palindrome is found.
"""
function p004_short(digits::Integer=3)::Integer
    min_num = 10^(digits - 1)
    max_num = 10^digits - 1
    products = (i * j for i in min_num:max_num for j in min_num:max_num if is_palindrome(i * j))
    return isempty(products) ? 0 : maximum(products)
end

"""
    p004_nice(digits::Integer=3) -> Integer

Find the largest palindrome that can be obtained by multiplying two n-digit numbers.

# Arguments
- `digits::Integer=3`: The number of digits for each factor.

# Returns
- `result::Integer`: The largest palindrome that can be obtained by multiplying two n-digit numbers. Returns 0 if no palindrome is found.
"""
function p004_nice(digits=3)
    max_by_digits = 10^digits - 1
    min_by_digits = 10^(digits - 1)
    a = max_by_digits
    largest_palindrome = 0
    while a >= min_by_digits
        c = 0
        if a % 11 == 0
            b = max_by_digits
            c = 1
        else
            b = 11 * (10^(digits - 1) - 10)
            c = 11
        end
        while b >= a
            if a * b <= largest_palindrome
                break
            end
            if is_palindrome(a * b)
                largest_palindrome = a * b
            end
            b -= c
        end
        a -= 1
    end
    return largest_palindrome
end

realizations[4] = [
    ProjectEuler.p004_naive,
    ProjectEuler.p004_short,
    ProjectEuler.p004_nice
]
