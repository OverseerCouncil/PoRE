package lab1.task3;

public class Task3 {
    public static void main(String[] args) {
        // Do not change this method!
        int[] student={9, 13, 3, 4, 20, 6, 11, 1, 12, 10, 2, 8, 19, 14, 15, 18, 7, 16, 17, 5};

        int[] result=new Party().outputrank(student,5);

        System.out.println("Party start!");
        for (int aResult : result) {
            System.out.println("Next one is: " + aResult);
        }

    }
}
