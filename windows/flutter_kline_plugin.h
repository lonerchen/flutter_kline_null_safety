#ifndef FLUTTER_PLUGIN_FLUTTER_KLINE_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_KLINE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_kline {

class FlutterKlinePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterKlinePlugin();

  virtual ~FlutterKlinePlugin();

  // Disallow copy and assign.
  FlutterKlinePlugin(const FlutterKlinePlugin&) = delete;
  FlutterKlinePlugin& operator=(const FlutterKlinePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_kline

#endif  // FLUTTER_PLUGIN_FLUTTER_KLINE_PLUGIN_H_
