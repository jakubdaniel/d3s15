import static gov.nasa.jpf.abstraction.Verifier.unknownInt;

class ArrayMin {
    public static void test() {
        int SIZE = 1;
        int[] array = new int[SIZE];
        int min = unknownInt();

        for (int j = 0; j < SIZE; ++j) {
            array[j] = unknownInt();

            if (array[j] < min) {
                min = array[j];
            }
        }

        assert array[0] >= min;
    }
}

public class ArrayMinEnv {
    static {
        System.load(System.getProperty("user.dir") + "/libarraymin.so.1.0");
    }

    public static void main(String[] args) {
        ArrayMin.test();
    }
}
