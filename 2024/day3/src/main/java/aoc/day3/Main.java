package aoc.day3;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
    private static final Scanner scan = new Scanner(System.in);
    private static final int N = 6;
    private static boolean DO = true;

    public static void main(String[] args) {
        int part1 = 0, part2 = 0;
        for (int i = 0; i < N; i++) {
            String line = scan.nextLine();
            part1 += compute(line, 1);
            part2 += compute(line, 2);
        }
        System.out.println(part1 + "\n" + part2);
    }

    private static int compute(String progLine, int part) {
        String pattern = "mul\\((\\d+),(\\d+)\\)" + (part == 2 ? "|do\\(\\)|don't\\(\\)" : "");
        Matcher m = Pattern.compile(pattern).matcher(progLine);

        int res = 0;
        while (m.find()) {
            if (part == 2) {
                switch (m.group()) {
                    case "don't()" -> DO = false;
                    case "do()" -> DO = true;
                    default -> {
                        if (DO) res += Integer.parseInt(m.group(1)) * Integer.parseInt(m.group(2));
                    }
                }
            } else {
                res += Integer.parseInt(m.group(1)) * Integer.parseInt(m.group(2));
            }
        }
        return res;
    }
}