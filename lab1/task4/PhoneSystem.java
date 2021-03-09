package lab1.task4;

public class PhoneSystem {

    // You need to modify this class.
    // TODO: How to set callback?

    public void performOnClick(CSCallBack ccb) {

        System.out.println("performOnClick clicked");
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        ccb.OnClick();
    }
}
