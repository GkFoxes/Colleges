package com.example.project7

import android.os.Bundle
import android.widget.ArrayAdapter
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.second.*

class SecondActivity : AppCompatActivity() {
    lateinit var arrayAdapter1: ArrayAdapter<String>
    lateinit var arrayAdapter2: ArrayAdapter<String>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.second)

        arrayAdapter1 = ArrayAdapter(this, R.layout.list_item1)
        arrayAdapter2 = ArrayAdapter(this, R.layout.list_item1)
        list_view1.adapter = arrayAdapter1
        list_view2.adapter = arrayAdapter2

        button_add_to_list1.setOnClickListener {
            arrayAdapter1.add(edit_text.text.toString())
        }

        button_add_to_list2.setOnClickListener {
            arrayAdapter2.add(edit_text.text.toString())
        }

        button_back.setOnClickListener {
            onBackPressed()
        }
    }
}