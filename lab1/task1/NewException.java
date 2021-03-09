package lab1.task1;

public class NewException extends Exception {
    // Do not change this method!
    public NewException(String message) {
        super("This in an new exception " + message);
    }
}