## Testing the code
Make sure the libraries are linked and built:
```
ls -la benchmark/build/src/libbenchmark.a
ls -la benchmark/build/src/libbenchmark.so
```

If this is all good, run the code to generate the benchmarks:
```
g++ -std=c++11 -O2 -isystem benchmark/include play_game.cpp benchmark_game.cpp -Wl,--start-group benchmark/build/src/libbenchmark.a benchmark/build/src/libbenchmark_main.a -Wl,--end-group -lpthread -o benchmark_game
```

And to execute, run `./benchmark_game`; an example of an output is shown below:
```
025-05-30T14:13:48+01:00
Running ./benchmark_game
Run on (16 X 3792.63 MHz CPU s)
CPU Caches:
  L1 Data 32 KiB (x8)
  L1 Instruction 32 KiB (x8)
  L2 Unified 1024 KiB (x8)
  L3 Unified 16384 KiB (x1)
Load Average: 0.47, 0.68, 0.40
---------------------------------------------------------
Benchmark               Time             CPU   Iterations
---------------------------------------------------------
BENCHMARK_game        773 ns          738 ns       896054
```