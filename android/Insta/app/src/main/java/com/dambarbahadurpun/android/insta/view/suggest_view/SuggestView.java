package com.dambarbahadurpun.android.insta.view.suggest_view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;

import androidx.annotation.Nullable;

import com.dambarbahadurpun.android.insta.R;

/**
 * Created by Dambar Bahadur Pun on 15/11/2020.
 */
public class SuggestView extends LinearLayout {
    private @Nullable
    OnActionClickListener onActionClickListener;

    public SuggestView(Context context) {
        super(context);
    }

    public SuggestView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public SuggestView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public SuggestView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    private void init(Context context) {
        View view = LayoutInflater.from(context).inflate(R.layout.suggest_view, null, false);
    }

    public void setTitle(String title) {

    }

    public void setSubtitle(String subtitle) {

    }

    public interface OnActionClickListener {
        void onClick();
    }

    public void setActionOnClickListener(OnActionClickListener onClickListener) {
        this.onActionClickListener = onClickListener;
    }

    static class Suggest {
        @Nullable
        private String title;
        @Nullable
        private String subtitle;
        @Nullable
        private String actionText;

        private Suggest(String title, String subtitle, String actionText) {
            this.title = title;
            this.subtitle = subtitle;
            this.actionText = actionText;
        }

        static class Builder {
            @Nullable
            private String title;
            @Nullable
            private String subtitle;
            @Nullable
            private String actionText;

            public Builder setTitle(String title) {
                this.title = title;
                return this;
            }

            public Builder setSubtitle(String subtitle) {
                this.subtitle = subtitle;
                return this;
            }

            public Builder setActionText(String actionText) {
                this.actionText = actionText;
                return this;
            }

            public Suggest build() {
                return new Suggest(title, subtitle, actionText);
            }
        }
    }
}
