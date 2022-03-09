"""
    is_prime(number:: Integer) -> Bool

Evalute if the `number` is prime or not.
"""
function is_prime(number::Integer)
    result = Bool(true)
    if number <= 1
        result = false
    elseif number <= 3
        result = true
    elseif number % 2 == 0
        result = false
    else
        for i in 3:2:floor(Int64, sqrt(number) + 1)
            if number % i == 0
                result = false
            end
        end
    end
    return result
end

"""
    primality(number:: Integer) -> Bool[]

Returns a list of `true` and `false` indicating whether each number is prime.
`true` if prime, `false` otherwise.
"""
function primality(number::Integer)
    result = zeros(Bool, number)
    for i in 1:number
        result[i] = is_prime(i)
    end
    return result
end