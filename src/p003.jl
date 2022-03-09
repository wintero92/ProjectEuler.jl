function p003_naive(value = 600_851_475_143)
    function _is_prime(value)
        if value == 1
            return false
        elseif value <= 3
            return true
        end
        if value % 2 == 0 || value % 3 == 0
            return false
        end
        i = 5
        while i * i <= value
            if value % i == 0 || value % (i + 2) == 0
                return false
            end
            i += 6
        end
        return true
    end
    max_divisor = 1
    divisor = 1
    while divisor <= floor(Int, sqrt(value))
        if value % divisor == 0 && _is_prime(divisor)
            max_divisor = divisor
        end
        divisor += 1
    end
    return max_divisor
end

function p003_short(value = 600_851_475_143)
    divisor = 2
    last_divisor = 1
    while value > 1
        if value % divisor == 0
            last_divisor = divisor
            value = fld(value, divisor)
        end
        divisor = divisor + 1
    end
    return last_divisor
end

function p003_nice(value = 600_851_475_143)
    if value % 2 == 0
        last_divisor = 2
        value = fld(value, 2)
        while value % 2 == 0
            value = fld(value, 2)
        end
    else
        last_divisor = 1
    end
    divisor = 3
    max_divisor = floor(Int, sqrt(value))
    while value > 1 && divisor <= max_divisor
        if value % divisor == 0
            value = fld(value, divisor)
            last_divisor = divisor
            max_divisor = floor(Int, sqrt(value))
        end
        divisor += 2
    end
    if value == 1
        return last_divisor
    else
        return value
    end
end

realizations[3] = [
    ProjectEuler.p003_naive,
    ProjectEuler.p003_short,
    ProjectEuler.p003_nice
]

#def compute():
#	n = 600851475143
#	while True:
#		p = smallest_prime_factor(n)
#		if p < n:
#			n //= p
#		else:
#			return str(n)

#def smallest_prime_factor(n):
#	assert n >= 2
#	for i in range(2, eulerlib.sqrt(n) + 1):
#		if n % i == 0:
#			return i
#	return n