function p004_naive(digits=3)
    function _is_palindrome(value)
        s = string(value)
        return s == reverse(s)
    end
    a = 10^digits-1
    largest_palindrome = 0
    while a >= 10^(digits-1)
        b = 10^digits-1
        while b >= a
            if a*b <= largest_palindrome
                break
            end
            if _is_palindrome(a*b)
                largest_palindrome = a*b
            end
            b -= 1
        end
        a -= 1
    end
    return largest_palindrome
end

function p004_short(digits=3)
end

function p004_nice(digits=3)
    function _reverse(value)
        reversed = 0
        while value > 0
            reversed = 10*reversed + value % 10
            value = fld(value, 10)
        end
        return reversed
    end
    function _is_palindrome(value) 
        return value == _reverse(value)
    end
    max_by_digits = 10^digits-1
    min_by_digits = 10^(digits-1)
    a = max_by_digits
    largest_palindrome = 0
    while a >= min_by_digits
        c = 0
        if a % 11 == 0
            b = max_by_digits
            c = 1
        else
            b = 11*(10^(digits-1)-10)
            c = 11
        end
        while b >= a
            if a*b <= largest_palindrome
                break
            end
            if _is_palindrome(a*b)
                largest_palindrome = a*b
            end
            b -= c
        end
        a -= 1
    end
    return largest_palindrome
end

realizations[4] = [
    ProjectEuler.p004_naive,
    ProjectEuler.p004_nice
]

# Computers are fast, so we can implement this solution directly without any clever math.
#def compute():
#	ans = max(i * j
#		for i in range(100, 1000)
#		    for j in range(100, 1000)
#		        if str(i * j) == str(i * j)[ : : -1])
#	return str(ans)