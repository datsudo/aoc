f = open("./in.txt", "r", encoding="utf-8").readlines()
_input = [l.rstrip() for l in f]


def is_safe(report) -> bool:
    report_decreasing = sorted(report, reverse=True) == report
    report_increasing = sorted(report) == report

    proper_diff = True
    for i in range(len(report) - 1):
        if abs(report[i] - report[i + 1]) not in {1, 2, 3}:
            proper_diff = False
            break

    return (report_increasing or report_decreasing) and proper_diff


def is_ACKSHUALLY_safe(report) -> bool:
    for i in range(len(report)):
        mod_report = report[:]
        del mod_report[i]
        if is_safe(mod_report):
            return True
    return False


def solution(part) -> int:
    total_safe = 0
    for r in _input:
        report = list(map(int, r.split(" ")))
        checker = is_safe if part == 1 else is_ACKSHUALLY_safe
        total_safe += 1 if checker(report) else 0
    return total_safe


print(solution(1))
print(solution(2))
