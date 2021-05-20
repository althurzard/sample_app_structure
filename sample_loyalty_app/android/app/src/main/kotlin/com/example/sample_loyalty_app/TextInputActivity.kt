package com.example.sample_loyalty_app

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.EditText


const val EXTRA_MESSAGE = "com.example.myfirstapp.MESSAGE"
const val TEXT_INPUT_REQUEST_CODE = 123
class TextInputActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_text_input)
    }

    fun doSomething(view: View) {
        val editText = findViewById<EditText>(R.id.editTextTextPersonName)
        val message = editText.text.toString()
        val intent = Intent()
        intent.putExtra(EXTRA_MESSAGE, message)
        setResult(Activity.RESULT_OK,intent)
        finish()
    }
}