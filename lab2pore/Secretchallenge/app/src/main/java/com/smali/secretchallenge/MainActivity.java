package com.smali.secretchallenge;

import android.annotation.SuppressLint;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import static android.support.v7.app.AlertDialog.Builder;

public class MainActivity extends AppCompatActivity {
    @SuppressLint("StaticFieldLeak")
    public static MainActivity mActivity;
    public TextView tv = null;
    boolean sbind = false;
    private EditText input_edit = null;
    private ServiceConnection connection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            sbind = true;
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            sbind = false;
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        input_edit = (EditText) findViewById(R.id.editText1);
        Button button = (Button) findViewById(R.id.button1);

        //This is the text that showed in the MainActivity.
        tv = (TextView) findViewById(R.id.text);

        mActivity = this;

        Intent bindintent = new Intent(this, SecretService.class);
        if (!sbind) {
            bindService(bindintent, connection, Context.BIND_AUTO_CREATE);
        }

        button.setOnClickListener(v -> {
            //This is the String you get from the EditText view.
            final String input = input_edit.getText().toString();

            Class pClass = null;
            try {
                pClass = Class.forName("com.pore.mylibrary.PoRELab");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Field pField = null;
            try {
                assert pClass != null;
                pField = pClass.getDeclaredField("curStr");
            } catch (NoSuchFieldException e) {
                e.printStackTrace();
            }
            assert pField != null;
            pField.setAccessible(true);
            String pString = null;
            try {
                pString = pField.get(pClass).toString();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
            Method pMethod = null;
            try {
                pMethod = pClass.getDeclaredMethod("privateMethod", String.class, String.class);
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
            assert pMethod != null;
            pMethod.setAccessible(true);
            try {
                pMethod.invoke("", "hello", pString);
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }


            final Handler handler = new Handler() {
                @Override
                public void handleMessage(Message msg) {
                    Builder builder = new Builder(MainActivity.this);
                    builder.setMessage((CharSequence) msg.obj);
                    builder.setCancelable(true);
                    AlertDialog dialog = builder.create();
                    dialog.show();
                }
            };

            new Thread(() -> {
                // Make a dialog rather than edit the text in main UI
                Message msg = new Message();
                msg.obj = input;
                handler.sendMessage(msg);
            }).start();

        });

    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (sbind) {
            unbindService(connection);
            sbind = false;
        }
    }

}
