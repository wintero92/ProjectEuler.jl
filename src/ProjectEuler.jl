module ProjectEuler

include("common.jl")

realizations = Dict{Int64,Array{Function,1}}()
export realizations

include("p001.jl")
include("p002.jl")
include("p003.jl")
include("p004.jl")
include("p005.jl")

end