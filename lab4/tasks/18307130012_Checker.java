public class Checker {

    public boolean check(String input) {
        if ((input.length() >= 12) && (input.length() < 16)) {
            int strCount = count(input.substring(10));
            if (strCount == func(strCount)) {
                return checkStr1(input.substring(0, 10));
            }
        }
        return false;
    }

    private int count(String input) {
        int num = 0;
        for (int i = 0 ; i < input.length() ; i = i + 1){
            if (input.charAt(i) == '1') {
                num = num + 1;
            }
        }
        return num;
    }

    private int func(int num) {
        if (num > 1) {
            num = func(num - 1) * num;
        }
        return num;
    }

    private boolean checkStr1(String input) {
        int firstX = 0;
        int secondX = 0;
        int numOfX = 0;
        for (int i = 0 ; i < input.length() ; i = i + 1) {
            if (input.charAt(i) == 'x') {
                numOfX = numOfX + 1;
                if (numOfX == 1) {
                    firstX = i;
                }
                else if (numOfX == 2) {
                    secondX = i;
                }
            }
        }
        String secret = "key";
        return (numOfX == 2) && ((secondX - firstX) == 4) && (input.charAt(0) == '0') &&
                (input.charAt(input.length() - 1) == '9') && (input.substring(0, firstX).contains(secret));
    }

}