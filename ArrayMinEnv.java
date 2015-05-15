public class ArrayMinEnv {
    static {
        System.load(System.getProperty("user.dir") + "/libarraymin.so.1.0");
    }

    public static void main(String[] args) {
        ArrayMin.test();
    }
}
