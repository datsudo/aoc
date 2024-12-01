import fs from "fs/promises";

let input = await fs.readFile("./in.txt", "utf-8")
let pairs = input.split("\n")
    .map(p => p.split("   "))
    .map(p => [Number.parseInt(p[0]), Number.parseInt(p[1])])
    .slice(0, -1)
let leftDist = pairs.map(p => p[0])
let rightDist = pairs.map(p => p[1])
let leftSorted = leftDist.sort((a, b) => a - b)
let rightSorted = rightDist.sort((a, b) => a - b)


function s1() {
    return leftSorted
        .map((l, i) => Math.abs(l - rightSorted[i]))
        .reduce((acc, curr) => acc + curr, 0)
}

function s2() {
    return leftDist
        .map(l => l * rightDist.filter(r => r == l).length)
        .reduce((acc, curr) => acc + curr, 0)
}

console.log(
    leftSorted
        .map((l, i) => Math.abs(l - rightSorted[i]))
        .reduce((acc, curr) => acc + curr, 0)
)

console.log(
    leftDist
        .map(l => l * rightDist.filter(r => r == l).length)
        .reduce((acc, curr) => acc + curr, 0)
)
