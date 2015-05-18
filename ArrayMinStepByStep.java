class ArrayMin {
    public static void test() {
        int SIZE = 1;
        int[] array = new int[SIZE];
        @2int min = unknownInt();@                (*\only<2-11>{[{\color{darkpurple}\bfseries{\btHL{0}}}]}*)

        for (int j = 0; j < SIZE; ++j) {
            @3@8array[j] = unknownInt();@@           (*\only<3-11>{[{\color{darkpurple}\bfseries\only<3-7>{{\btHL{0}}}\only<8-11>{0}\only<6-7>{, -1}\only<8-11>{, {\btHL{-1}}}}]}*)

            if (@4@9array[j] < min@@) {              (*\only<4>{{\color{darkblue}\bfseries{nondet}}}\only<5>{{\color{darkorange}\bfseries{0 < 0}}}\only<10>{{\color{darkorange}\bfseries{-1 < 0}}}*)
                @10min = array[j];@                (*\only<5>{{\color{darkorange}\bfseries{pruned}}, {\color{darkblue}\bfseries{feasible}}}*)
            }
        }

        @7@11assert array[0] >= min;@@                (*\only<7,11>{\color{darkgreen}\bfseries{end, no error}}*)
    }
}
