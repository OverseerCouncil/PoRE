import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import static java.lang.String.*;

public class Encoder {

    private String algorithm = "MD5";
    private String charSet = "utf-8";
    private final String[] hexDigits= {"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"};

    private String byteArrayToHexString(byte[] bytes) {
        StringBuilder strBufTemp = new StringBuilder();
        for (byte tempByte : bytes) {
            strBufTemp.append(byteToHexString(tempByte));
        }
        return strBufTemp.toString();
    }

    private String byteToHexString(byte in) {
        int tempNum = in;
        if (tempNum < 0) tempNum = tempNum & 0xFF;
        int quotient = tempNum / 16;
        int remainder = tempNum % 16;
        return hexDigits[quotient] + hexDigits[remainder];
    }

    private String getSalt() {
        Random random = new Random();
        StringBuilder tempStrBuilder = new StringBuilder(16);
        for (int i = 0 ; i < 16 ; i = i + 1) {
            if (random.nextBoolean()) {
                tempStrBuilder.append(1);
            }
            else {
                tempStrBuilder.append(0);
            }
        }
        return tempStrBuilder.toString();
    }

    public boolean check(String input , String encoding) {
        boolean resBoolean = false;
        if (encoding.length() == 48) {
            char[] charArray32 = new char[32];
            char[] charArray16 = new char[16];
            for (int i = 0; i < 48 ; i = i + 3) {
                charArray32[i * 2 / 3] = encoding.charAt(i);
                charArray32[i * 2 / 3 + 1] = encoding.charAt(i + 2);
                charArray16[i / 3] = encoding.charAt(i + 1);
            }
            String tempStr = input + valueOf(charArray16);
            try {
                MessageDigest md = MessageDigest.getInstance(algorithm);
                String mdTempStr = byteArrayToHexString(md.digest(tempStr.getBytes(charSet)));
                String str32 = new String(charArray32);
                resBoolean = mdTempStr.equals(str32);
            } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return resBoolean;
    }

    public String encoding(String encodingStr) {
        String resStr="";
        String Salt = getSalt();
        String tempStr = encodingStr + Salt;
        try {
            MessageDigest md = MessageDigest.getInstance(algorithm);
            tempStr = byteArrayToHexString(md.digest(tempStr.getBytes(charSet)));
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
            return resStr;
        }
        try {
            char[] charArray48 = new char[48];
            for (int i = 0 ; i < 48 ; i = i + 3){
                charArray48[i] = tempStr.charAt(i * 2 / 3);
                charArray48[i + 1] = Salt.charAt(i / 3);
                charArray48[i + 2] = tempStr.charAt(i * 2 / 3 + 1);
            }
            resStr = valueOf(charArray48);
        } catch (Exception e) {
            resStr = tempStr;
            e.printStackTrace();
            return resStr;
        }
        return resStr;
    }

}
