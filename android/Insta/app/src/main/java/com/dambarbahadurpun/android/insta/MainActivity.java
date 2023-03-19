package com.dambarbahadurpun.android.insta;

import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;

import com.google.android.material.bottomnavigation.BottomNavigationView;

public class MainActivity extends AppCompatActivity {
    private NavController mNavController;
    private AppBarConfiguration mAppBarConfiguration;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setupToolbar();
        BottomNavigationView navView = findViewById(R.id.mainActivity_bottom_nav);
//         Passing each menu ID as a set of Ids because each
//         menu should be considered as top level destinations.
        mAppBarConfiguration = new AppBarConfiguration.Builder(R.id.homeFragment, R.id.searchFragment, R.id.cameraFragment, R.id.myActivityFragment, R.id.profileFragment).build();
        mNavController = Navigation.findNavController(this, R.id.mainActivity_nav_host_fragment);
        NavigationUI.setupActionBarWithNavController(this, mNavController, mAppBarConfiguration);
        NavigationUI.setupWithNavController(navView, mNavController);
    }

    private void setupToolbar() {
        final Toolbar toolbar = findViewById(R.id.mainActivity_toolbar);
        setSupportActionBar(toolbar);
    }
}