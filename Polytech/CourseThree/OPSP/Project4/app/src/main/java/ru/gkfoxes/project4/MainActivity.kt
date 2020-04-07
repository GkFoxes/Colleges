package ru.gkfoxes.project4

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.core.content.ContextCompat
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), View.OnClickListener {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_main)

        button_sum.setOnClickListener(this)
        button_min.setOnClickListener(this)
        button_mul.setOnClickListener(this)
        button_del.setOnClickListener(this)
    }

    override fun onClick(v: View?) {
        if (edit_text1.text.isNotEmpty() and edit_text2.text.isNotEmpty()) {
            val number1 = edit_text1.text.toString().toInt()
            val number2 = edit_text2.text.toString().toInt()

            answer.text = when (v?.id) {
                R.id.button_sum -> number1.toString() + " + " + number2.toString() + " = " + (number1 + number2).toString()
                R.id.button_min -> number1.toString() + " - " + number2.toString() + " = " + (number1 - number2).toString()
                R.id.button_mul -> number1.toString() + " * " + number2.toString() + " = " + (number1 * number2).toString()
                R.id.button_del -> number1.toString() + " / " + number2.toString() + " = " + (number1.toFloat() / number2.toFloat()).toString()

                else -> null
            }
        }
    }
}
