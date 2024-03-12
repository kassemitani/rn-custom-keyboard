package com.keyboard.customKeyboard

import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp


class CustomKeyboardManager : SimpleViewManager<CustomKeyboardView>() {
    override fun getName() = "CustomKeyboard"

    override fun createViewInstance(reactContext: ThemedReactContext): CustomKeyboardView {
        return CustomKeyboardView(reactContext)
    }

    @ReactProp(name = "deleteIcon")
    fun setDeleteIcon(view: CustomKeyboardView, name: String) {
//        view.findViewById<Button>(R.id.buttonX).setText(name)
    }
}
