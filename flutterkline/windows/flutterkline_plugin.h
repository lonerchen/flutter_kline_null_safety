#ifndef FLUTTER_PLUGIN_FLUTTERKLINE_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTERKLINE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutterkline {

class FlutterklinePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterklinePlugin();

  virtual ~FlutterklinePlugin();

  // Disallow copy and assign.
  FlutterklinePlugin(const FlutterklinePlugin&) = delete;
  FlutterklinePlugin& operator=(const FlutterklinePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutterkline

#endif  // FLUTTER_PLUGIN_FLUTTERKLINE_PLUGIN_H_
