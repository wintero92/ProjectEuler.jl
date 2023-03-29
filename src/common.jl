"""
    is_prime(number::Integer) -> Bool

Determine whether `number` is prime.

# Arguments
- `number::Integer`: the number to check for primality

# Returns
- `result::Bool`: `true` if `number` is prime, `false` otherwise
"""
function is_prime(number::Integer)::Bool
    if number <= 1
        return false
    elseif number == 2 || number == 3
        return true
    elseif number % 2 == 0 || number % 3 == 0
        return false
    end

    # Use the Sieve of Eratosthenes to precompute all prime numbers up to sqrt(number)
    primes = UInt64[2, 3]
    max_factor = floor(UInt64, sqrt(number))
    for i in 5:2:max_factor
        if all(i % p != 0 for p in primes)
            push!(primes, i)
        end
    end

    # Check if number is divisible by any prime up to sqrt(number)
    for p in primes
        if p > max_factor
            break
        end
        if number % p == 0
            return false
        end
    end

    return true
end

"""
    primality(number::Integer) -> Bool[]

Determine the primality of all integers up to `number`.

# Arguments
- `number::Integer`: the maximum integer to check for primality

# Returns
- `result::Array{Bool}`: a boolean array where `result[i]` is `true` if `i` is prime and `false` otherwise.
"""
function primality(number::Integer)
    result = zeros(Bool, number)
    for i in 1:number
        result[i] = is_prime(i)
    end
    return result
end

"""
    is_palindrome(value::Integer) -> Bool

Check if an integer is a palindrome.

# Arguments
- `value`: The integer to check.

# Returns
- `is_palindrome`: `true` if `value` is a palindrome, `false` otherwise.
"""
function is_palindrome(value::Integer)::Bool
    value_digits = digits(value)
    n = length(value_digits)
    for i in 1:(n÷2)
        if value_digits[i] != value_digits[n-i+1]
            return false
        end
    end
    return true
end