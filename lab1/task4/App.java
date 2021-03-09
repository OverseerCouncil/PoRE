package lab1.task4;

public class App implements CSCallBack {

    // You need to modify this class.
    // TODO: How to set callback?

    private PhoneSystem system;

    public App(PhoneSystem system) {
        this.system = system;
    }

    public void click() {
        System.out.println("Button clicked");
        system.performOnClick(this);
    }

    @Override
    public void OnClick() {
        System.out.println("You click this button, so I will do ...");
    }
}
