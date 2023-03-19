package com.dambarbahadurpun.android.insta;

import android.content.Intent;
import android.os.Bundle;
import android.transition.TransitionInflater;

import androidx.appcompat.app.AppCompatActivity;

public class SplashActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);
        setTranstition();
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Thread.sleep(2000);
                    Intent intent = new Intent(SplashActivity.this, LoginActivity.class);
                    startActivity(intent);
                    finish();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    private void setTranstition() {
        getWindow().setEnterTransition(TransitionInflater.from(this).inflateTransition(R.anim.fade_in));
        getWindow().setExitTransition(TransitionInflater.from(this).inflateTransition(R.anim.fade_out));
    }
}