public class StringArrayTest {
    public static String[] generateStringArray(Integer n) {
        String[] listNumber = new List<String>();
        Integer i = 0;
        for (i = 0; i < n; i ++) {
            System.debug('Test ' + i);
            listNumber.add('Test ' + i);
        }
        // System.debug('TESTING');
        return listNumber;
    }
}
