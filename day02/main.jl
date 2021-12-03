function readInput(path::String)
    return open(f->read(f, String), path)
end

directions = Dict{String,Array}(
    "forward" => [1 0],
    "back"    => [-1 0],
    "up"      => [0 -1],
    "down"    => [0 1]
)

function part1(input)
    position = [0 0]
    moves = [directions[split(s)[1]] * parse(Int, split(s)[2]) for s in input]
    return prod(position + sum(moves))
end

function part2(input)
    position = [0 0]
    aim = 0
    for s in input
        (x,y) = directions[split(s)[1]] * parse(Int, split(s)[2])
        aim += y
        position += [x x*aim]
    end
    return prod(position)
end

function main()
    input = readInput("input.txt")
    input = split(input, "\n")
    println(part1(input), " ", part2(input))
end

main()