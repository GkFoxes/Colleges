package ru.gkfoxes.project5

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import androidx.core.content.ContextCompat
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), AdapterView.OnItemClickListener {
    lateinit var arrayAdapter: ArrayAdapter<String>
    private var lastPosition: Int? = null
    private var lastView: View? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_main)

        arrayAdapter = ArrayAdapter(this, R.layout.list5)
        list_view.adapter = arrayAdapter
        list_view.onItemClickListener = this

        button_edit.isEnabled = false
        button_del.isEnabled = false

        arrayAdapter.add("First")
        arrayAdapter.add("Second")
        arrayAdapter.add("Third")

        button_add.setOnClickListener {
            arrayAdapter.add(edit_text.text.toString())
        }

        button_edit.setOnClickListener {
            if (lastPosition != null) {
                val string = arrayAdapter.getItem(lastPosition!!)
                arrayAdapter.remove(string)
                arrayAdapter.insert(edit_text.text.toString(), lastPosition!!)
            }
        }

        button_del.setOnClickListener {
            if (lastPosition != null) {
                val string = arrayAdapter.getItem(lastPosition!!)
                arrayAdapter.remove(string)
                button_edit.isEnabled = false
                button_del.isEnabled = false

                lastView!!.setBackgroundColor(ContextCompat.getColor(this, R.color.colorYellow))
            }
        }

        button_clear.setOnClickListener {
            arrayAdapter.clear()
            button_edit.isEnabled = false
            button_del.isEnabled = false
        }
    }

    override fun onItemClick(parent: AdapterView<*>?, view: View?,
                             position: Int, id: Long) {

        if (lastView != null) {
            lastView!!.setBackgroundColor(ContextCompat.getColor(this, R.color.colorYellow))
        }

        val string = arrayAdapter.getItem(position)
        lastPosition = position
        edit_text.setText(string)

        button_edit.isEnabled = true
        button_del.isEnabled = true

        lastView = view
        view?.setBackgroundColor(ContextCompat.getColor(this, R.color.colorBlack))
    }
}
