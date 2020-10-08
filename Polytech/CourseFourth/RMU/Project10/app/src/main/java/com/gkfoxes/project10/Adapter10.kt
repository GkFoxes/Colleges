package com.gkfoxes.project10

import android.content.Context
import android.graphics.Color
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.TextView
import androidx.core.content.ContextCompat

class Adapter10(val names: Array<String>) : BaseAdapter() {

    override fun getCount(): Int {
        return names.size  //возвращаем длину массива строк
    }

    override fun getItem(position: Int): Any {
        return names[position] //возвращаем элемент списка по его позиции в списке, в нашем случае
        //элементом списка является строка
    }

    override fun getItemId(position: Int): Long {
        return position.toLong() //возвращаем идентификатор элемента списка, в данном случае считаем, что
        //идентификатор совпадает с позицией элемента
    }

    override fun getView(position: Int, view: View?, parent: ViewGroup): View? {
        var view = view
        val context =
            parent.context /* Context – это класс, который содержит многие полезные методы.  Любая активность является наследником от этого класса, поэтому к его методам можно обращаться из класса-активности, но адаптер не является наследником от Context, следовательно, если нам потребуются методы Context-а в адаптере, следует получить там каким-либо образом объект класса Context, например, с помощью метода getContext списка. */

        if (view == null) {  //объекта – элемента разметки для нашего пункта списка не существует, поэтому
            //мы его создаем
            val inflater =
                context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater  //с помощью метода
            // getSystemService объекта context класса Context создаем объект inflater класса LayoutInflater
            view = inflater.inflate(
                R.layout.list_item,
                parent,
                false
            ) //с помощью метода inflate объекта inflater
            //создаем из разметки для элемента списка, находящегося в файле list_item.xml папки layout,
            // дерево объектов и возвращаем ссылку на корневой элемент этого дерева.  В данном случае
            //дерево у нас состоит из одного узла - элемента TextView.
        }

        val textView = view as TextView? //преобразуем класс объекта – элемента разметки к TextView
        textView!!.text =
            names[position] //в элемент, находящийся в списке на позиции position, помещаем

        val nextColor: Int
        if (position % 2 == 0) {
            nextColor = R.color.colorRed
        } else {
            nextColor = R.color.colorBlue
        }
        textView.setBackgroundColor(ContextCompat.getColor(context, nextColor))
        return view //возвращаем сформированный объект-элемент разметки
    }
}
