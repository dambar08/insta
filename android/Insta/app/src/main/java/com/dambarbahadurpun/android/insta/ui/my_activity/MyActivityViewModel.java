package com.dambarbahadurpun.android.insta.ui.my_activity;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class MyActivityViewModel extends ViewModel {

    private MutableLiveData<String> mText;

    public MyActivityViewModel() {
        mText = new MutableLiveData<>();
        mText.setValue("This is home fragment");
    }

    public LiveData<String> getText() {
        return mText;
    }
}