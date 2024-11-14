import fs from "fs/promises";

let input = await fs.readFile("./2.txt", "utf-8")
let intcode = input.split("\n")[0].split(",").map((i) => Number.parseInt(i))


function runIntcode(prog_list, noun, verb) {
    prog_list[1] = noun; prog_list[2] = verb;
    return run(prog_list, 0, prog_list[0]);
}

function run(prog_list, curr_pos, opcode) {
    if (opcode === 99) {
        return prog_list[0];
    }

    let addr1 = prog_list[curr_pos + 1],
        addr2 = prog_list[curr_pos + 2],
        outAddr = prog_list[curr_pos + 3];

    let result = opcode === 1
        ? prog_list[addr1] + prog_list[addr2]
        : prog_list[addr1] * prog_list[addr2];
    prog_list[outAddr] = result;

    let newpos = curr_pos + 4;
    return run(prog_list, newpos, prog_list[newpos])
}

function findBestPairs(prog_list, target) {
    let noun, verb, res;
    let orig_list = prog_list.slice();
    for (noun = 0; noun <= 99; noun++) {
        for (verb = 0; verb <= 99; verb++) {
            res = runIntcode(prog_list, noun, verb);
            if (res === target) {
                return 100 * noun + verb;
            }
            prog_list = orig_list.slice();
        }
    }
}

console.log(runIntcode(intcode.slice(), 12, 2))  // part1
console.log(findBestPairs(intcode.slice(), 19690720));  // part2



// Local Variables:
// compile-command: "node 2.js"
// End:
