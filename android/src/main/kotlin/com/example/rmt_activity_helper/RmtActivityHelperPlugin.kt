package com.example.rmt_activity_helper

import androidx.annotation.NonNull
import android.app.Application
import android.content.Intent
import android.net.Uri
import android.widget.Toast
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import androidx.wear.remote.interactions.RemoteActivityHelper

/** RmtActivityHelperPlugin */
class RmtActivityHelperPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var application: Application

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "rmt_activity_helper")
    channel.setMethodCallHandler(this)
    application = flutterPluginBinding.applicationContext as Application
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "remoteSendTo") {
      val remoteActivityHelper =
        RemoteActivityHelper(application)
      val arguments = call.arguments as Map<*, *>
      val nodeId = arguments["deviceId"] as String
      val path = arguments["path"] as String

      if (nodeId == null) {
        Toast.makeText(application, "No connected wear watch", Toast.LENGTH_SHORT).show()

      } else {

          try {
            remoteActivityHelper.startRemoteActivity(
              Intent(Intent.ACTION_VIEW)
                .addCategory(Intent.CATEGORY_BROWSABLE)
                .setData(
                  Uri.parse(path)
                ), nodeId
            )
            result.success(1)
          } catch (e: Exception) {
            Toast.makeText(application, "Unable to open mobile app: ${e.message}", Toast.LENGTH_SHORT).show()
          }
        }

    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
