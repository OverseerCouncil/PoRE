package lab1.task3;

import java.util.Arrays;

public class Party {

    public int[] outputrank(int[] originalrank, int interval) {
        int[] result = new int[originalrank.length];
        boolean[] SupResult = new boolean[originalrank.length];
        Arrays.fill(SupResult, false);
        int ChosenOne = -1;
        for (int i = 0; i < originalrank.length; i = i + 1) {
            int Count = 0;
            while (Count < 5) {
                ChosenOne = ChosenOne + 1;
                if (ChosenOne >= originalrank.length) {
                    ChosenOne = ChosenOne - originalrank.length;
                }
                if (SupResult[ChosenOne] == false) {
                    Count = Count + 1;
                }
            }
            result[i] = originalrank[ChosenOne];
            SupResult[ChosenOne] = true;
        }
        return result;
    }

}
