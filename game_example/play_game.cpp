#include <iostream>
#include <string>

std::string fizz_buzz(int n) {
    if (n % 15 == 0) {
        return "FizzBuzz";
    } else if (n % 3 == 0) {
        return "Fizz";
    } else if (n % 5 == 0) {
        return "Buzz";
    } else {
        return std::to_string(n);
    }
}

void play_game(int n, bool should_print) {
    std::string result = fizz_buzz(n);
    if (should_print) {
        std::cout << result << std::endl;
    }
}