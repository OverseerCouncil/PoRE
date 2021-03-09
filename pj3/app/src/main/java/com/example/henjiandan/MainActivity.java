package com.example.henjiandan;

//created by honglingyi
//and so compiled by honglingyi


import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {


    protected EditText input;

    static {
        System.loadLibrary("henjiandan");
    }

    public native int check(String str);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        this.input = (EditText) findViewById(R.id.et_1);

        ((Button) findViewById(R.id.btn_textview)).setOnClickListener(new View.OnClickListener() {

            public void onClick(View view) {

                String input = MainActivity.this.input.getText().toString();

                if (input.length() < 6) {
                    Toast.makeText(MainActivity.this.getApplicationContext(), "pig！", Toast.LENGTH_SHORT).show();
                    return;
                }
                if (!(input.substring(0, 4).equals("WZNB"))) {
                    Toast.makeText(MainActivity.this.getApplicationContext(), "前四位就错了，菜！", Toast.LENGTH_SHORT).show();
                    return;
                }

                if((!(input.substring(4,5).equals("{")))||(!(input.substring(input.length()-1,input.length()).equals("}"))))
                {
                    Toast.makeText(MainActivity.this.getApplicationContext(), "不看格式要求就来做？", Toast.LENGTH_SHORT).show();
                    return;

                }

                Toast.makeText(MainActivity.this.getApplicationContext(), "前四位对了，马上就要做出来了！", Toast.LENGTH_SHORT).show();
                String sub = input.substring(5, input.length() - 1);
                int result = MainActivity.this.check(sub);
                if (result == 2) {
                    String ss=input.substring(5, input.length() - 1);
                    char[]cs=ss.toCharArray();
                    int cnt=0;
                    for(int i=0;i<ss.length();i++)
                    {
                        cnt+=cs[i];

                    }
                    if(cnt>2465) {
                        Toast.makeText(MainActivity.this.getApplicationContext(), "不行哦，注意题目要求～", Toast.LENGTH_SHORT).show();
                        //return;
                    }
                    else
                    Toast.makeText(MainActivity.this.getApplicationContext(), "right!", Toast.LENGTH_LONG).show();
                }
                else if (result == 1)
                    Toast.makeText(MainActivity.this.getApplicationContext(), "全错，没一位对的", Toast.LENGTH_SHORT).show();
                else
                    Toast.makeText(MainActivity.this.getApplicationContext(), "nbnb,就差几位了！", Toast.LENGTH_SHORT).show();
            }
        });

    }
}
