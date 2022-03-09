function p002_naive(below = 4_000_000)
    pre = 1
    cur = 2
    s = 0
    while cur < below
        if cur % 2 == 0
            s += cur
        end
        new = pre + cur
        pre = cur
        cur = new
    end
    return s
end

function p002_short(below = 4_000_000)
    function _run(pre, cur, n, below)
        cur > below ? n : _run(cur, pre + cur, cur % 2 == 0 ? n + cur : n, below)
    end
    return _run(1, 2, 0, below)
end

function p002_nice(below = 4_000_000)
    f3 = 2
    f6 = 0
    r = 2
    s = 0
    while r < below
        s += r
        r = 4 * f3 + f6
        f6 = f3
        f3 = r
    end
    return s
end

realizations[2] = [
    ProjectEuler.p002_naive,
    ProjectEuler.p002_short,
    ProjectEuler.p002_nice
]