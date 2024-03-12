package com.keyboard.customKeyboard

import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import android.widget.Button
import android.widget.GridLayout
import android.widget.LinearLayout
import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.ReactContext
import com.keyboard.R


class CustomKeyboardView @JvmOverloads constructor(
    context: Context, attrs: AttributeSet? = null, defStyleAttr: Int = 0
) : LinearLayout(context, attrs, defStyleAttr) {

    private var gridLayout: GridLayout

    init {
        orientation = VERTICAL

        LayoutInflater.from(context).inflate(R.layout.custom_keyboard, this, true)
        // Setup buttons
        gridLayout = findViewById(R.id.gridLayout);
        randomizeDigits()
        setupDeleteButtonListener()
    }

    private fun randomizeDigits() {
        // List of digits to randomize
        val digits = (0..9).shuffled()

        var digitIndex = 0

        for (i in 0 until gridLayout.childCount) {
            val view = gridLayout.getChildAt(i)
            // Only randomize the buttons with tags, which are not 'X'
            if (view is Button && view.tag != null && view.text != "X") {
                val text =  digits[digitIndex++].toString()
                view.text = text
                view.setOnClickListener {
                    emitKeyPressEvent(text)
                }
            }
        }
    }

    private fun setupDeleteButtonListener() {
        findViewById<Button>(R.id.buttonX).setOnClickListener {
            emitKeyPressEvent("DELETE")
        }
    }

    private fun emitKeyPressEvent(key: String) {
        val reactContext = context as ReactContext
        val event = Arguments.createMap().apply {
            putString("key", key)
        }
        reactContext.getJSModule(ReactContext.RCTDeviceEventEmitter::class.java).emit("onKeyPress", event)
    }
}
