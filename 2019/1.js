import fs from "fs/promises";

let input = await fs.readFile("./1.txt", "utf-8")
let modules = input.split("\n").map((i) => Number.parseInt(i)).slice(0, -1)

let inputtest = [100756]

function getTotalFuel(mass, accum = 0) {
    let fuel = Math.floor(mass / 3) - 2
    if (Math.floor(fuel / 3) <= 0) {
        return accum + (fuel > 0 ? fuel : 0)
    }
    return getTotalFuel(fuel, accum + fuel)
}

function s1(modules) {
    return modules.map((mass) => Math.floor(mass / 3) - 2).reduce((acc, curr) => acc + curr, 0)
}

function s2(modules) {
    return modules.map((mass) => getTotalFuel(mass)).reduce((acc, curr) => acc + curr, 0)
}

console.log(s2(modules))



// Local Variables:
// compile-command: "node 1.js"
// End:
