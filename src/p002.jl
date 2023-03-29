"""
    p002_naive(below::Integer=4_000_000) -> Integer

Return the sum of all even-valued Fibonacci terms below a given limit `below`
using a naive implementation.

# Arguments:
- `below::Integer = 4_000_000`: The upper limit to sum even Fibonacci terms below.

# Returns:
- `s::Integer`: The sum of all even-valued Fibonacci terms below `below`.
"""
function p002_naive(below::Integer=4_000_000)::Integer
    pre::Integer = 1
    cur::Integer = 2
    s::Integer = 0
    while cur < below
        if (cur & 1) == 0
            s += cur
        end
        pre, cur = cur, pre + cur
    end
    return s
end

"""
    p002_short(below::Integer=4_000_000) ->Integer

Return the sum of all even-valued Fibonacci terms below a given limit `below`
using a recursive implementation.

# Arguments:
- `below::Integer = 4_000_000`: The upper limit to sum even Fibonacci terms below.

# Returns:
- `n::Integer`: The sum of all even-valued Fibonacci terms below `below`.
"""
function p002_short(below::Integer=4_000_000)::Integer
    function _run(pre::Integer, cur::Integer, n::Integer, below::Integer)::Integer
        cur > below ? n : _run(cur, pre + cur, cur % 2 == 0 ? n + cur : n, below)
    end
    return _run(1, 2, 0, below)
end

"""
    p002_nice(below::Integer=4_000_000) -> Integer

Return the sum of all even-valued Fibonacci terms below a given limit `below`
using an optimized implementation.

# Arguments:
- `below::Integer = 4_000_000`: The upper limit to sum even Fibonacci terms below.

# Returns:
- `s::Integer`: The sum of all even-valued Fibonacci terms below `below`.
"""
function p002_nice(below = 4_000_000)
    f3::Integer = 2
    f6::Integer = 0
    r::Integer = 2
    s::Integer = 0
    while r < below
        s += r
        r = 4 * f3 + f6
        f6, f3 = f3, r
    end
    return s
end

realizations[2] = [
    ProjectEuler.p002_naive,
    ProjectEuler.p002_short,
    ProjectEuler.p002_nice
]