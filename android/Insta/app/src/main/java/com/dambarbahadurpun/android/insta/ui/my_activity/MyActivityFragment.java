package com.dambarbahadurpun.android.insta.ui.my_activity;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProviders;

import com.dambarbahadurpun.android.insta.R;

public class MyActivityFragment extends Fragment {

    private MyActivityViewModel myActivityViewModel;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        myActivityViewModel =
                ViewModelProviders.of(this).get(MyActivityViewModel.class);
        View root = inflater.inflate(R.layout.fragment_my_activity, container, false);
        myActivityViewModel.getText().observe(getViewLifecycleOwner(), new Observer<String>() {
            @Override
            public void onChanged(@Nullable String s) {

            }
        });
        return root;
    }
}