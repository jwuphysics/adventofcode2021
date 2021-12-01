module Day01

function readInput(path::String)
    s = open(path, "r") do file
        read(file, String)
    end
    return s
end

function part1(values)
    num = 0
    for (a, b) in zip(values[1:end-1], values[2:end])
        if b > a
            num += 1
        end
    end
    return num
end

function part2(values)
    sums = [(a+b+c) for (a, b, c) in zip(values[1:end-2], values[2:end-1], values[3:end])]
    return part1(sums)
end

function main(input::String = readInput("input.txt"))
    values = parse.(Int, split(input))
    return [part1(values), part2(values)]
end

println(main())

end