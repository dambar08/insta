package com.dambarbahadurpun.android.insta.ui.other_profile;

import androidx.lifecycle.ViewModelProviders;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.dambarbahadurpun.android.insta.R;

public class OtherProfile extends Fragment {

    private OtherProfileViewModel mViewModel;

    public static OtherProfile newInstance() {
        return new OtherProfile();
    }

    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.other_profile_fragment, container, false);
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        mViewModel = ViewModelProviders.of(this).get(OtherProfileViewModel.class);
        // TODO: Use the ViewModel
    }

}