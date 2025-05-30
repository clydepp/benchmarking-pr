#include "play_game.h"
#include <../benchmark/benchmark.h>
#include <iostream>

static void BENCHMARK_game(benchmark::State &state)
{
    for (auto _ : state)
    {
        for (int i = 1; i <= 100; i++)
        {
            play_game(i, false);
        }
    }
}

BENCHMARK(BENCHMARK_game);

BENCHMARK_MAIN();