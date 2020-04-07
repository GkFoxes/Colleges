package ru.gkfoxes.project3

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.core.content.ContextCompat
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), View.OnClickListener {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_main)

        btn1.setOnClickListener(this)
        btn2.setOnClickListener(this)
        btn3.setOnClickListener(this)
        btn4.setOnClickListener(this)
        btn5.setOnClickListener(this)
        btn6.setOnClickListener(this)
    }

    override fun onClick(v: View?) {
        when (v!!.id) {
            R.id.btn1 -> {
                tv1.setBackgroundColor(ContextCompat.getColor(this, R.color.colorRed))
                tv2.setBackgroundColor(ContextCompat.getColor(this, R.color.colorRed))
                tv1.setTextColor(resources.getColor(R.color.colorGreen))
                tv2.setTextColor(resources.getColor(R.color.colorGreen))
            }

            R.id.btn2 -> {
                tv1.setBackgroundColor(ContextCompat.getColor(this, R.color.colorYellow))
                tv2.setBackgroundColor(ContextCompat.getColor(this, R.color.colorYellow))
                tv1.setTextColor(resources.getColor(R.color.colorBlue))
                tv2.setTextColor(resources.getColor(R.color.colorBlue))
            }

            R.id.btn3 -> {
                tv1.setBackgroundColor(ContextCompat.getColor(this, R.color.colorBlack))
                tv2.setBackgroundColor(ContextCompat.getColor(this, R.color.colorBlack))
                tv1.setTextColor(resources.getColor(R.color.colorWhite))
                tv2.setTextColor(resources.getColor(R.color.colorWhite))
            }

            R.id.btn4 -> {
                ll.setBackgroundColor(ContextCompat.getColor(this, R.color.colorRed))
            }

            R.id.btn5 -> {
                ll.setBackgroundColor(ContextCompat.getColor(this, R.color.colorBlue))
            }

            R.id.btn6 -> {
                ll.setBackgroundColor(ContextCompat.getColor(this, R.color.colorBlack))
            }
        }
    }
}
