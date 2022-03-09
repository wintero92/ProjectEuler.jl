function p001_naive(below = 1000)
    result = 0
    for v in 1:below-1
        if v % 3 == 0 || v % 5 == 0
            result += v
        end
    end
    return result
end

p001_short(below = 1000) = sum(v % 3 == 0 || v % 5 == 0 ? v : 0 for v in 1:below-1)

function _sum_divisible(multiple, divisor)
    p = fld(multiple, divisor)
    return fld(divisor * (p * (p + 1)), 2)
end

function p001_nice(below = 1000)
    return _sum_divisible(below - 1, 3) + _sum_divisible(below - 1, 5) - _sum_divisible(below - 1, 15)
end

realizations[1] = [
    ProjectEuler.p001_naive,
    ProjectEuler.p001_short,
    ProjectEuler.p001_nice
]