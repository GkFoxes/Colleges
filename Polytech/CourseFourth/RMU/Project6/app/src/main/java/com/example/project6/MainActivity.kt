package com.example.project6

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), View.OnClickListener {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        button_second_act.setOnClickListener(this)
        button_third_act.setOnClickListener(this)
    }

    override fun onClick(v: View?) {
        val nextActivity = when (v?.id) {
            R.id.button_second_act -> SecondActivity::class.java
            R.id.button_third_act -> ThirdActivity::class.java
            else -> null
        }
        startActivity(Intent(this, nextActivity))
    }
}