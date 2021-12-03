function readInput(path::String)
    input = open(f->read(f, String), path)
    input = split(input, "\n")

    # I can't figure out a better approach to read matrix
    Nrow = length(input)
    Ncol = length(input[1])
    m = Array{Bool}(undef, (Nrow, Ncol))
    for row = 1:Nrow
       for (col,value) = enumerate(input[row])
           m[row,col] = parse(Bool,value)
       end
   end

   return m
end

function part1(matrix)
    (Nrow, Ncol) = size(matrix)
    gamma_array = (sum(matrix, dims=1) .> Nrow/2)
    epsilon_array = (sum(matrix, dims=1) .< Nrow/2)

    # .chunks is in bit-reversed order
        gamma_rate = reinterpret(Int, reverse(gamma_array).chunks[1])
        epislon_rate = reinterpret(Int, reverse(epsilon_array).chunks[1])

    return gamma_rate * epislon_rate
end

function main()
    matrix = readInput("input.txt")
    println(part1(matrix), " ")
end

main()