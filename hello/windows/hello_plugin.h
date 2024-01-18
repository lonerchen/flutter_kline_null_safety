#ifndef FLUTTER_PLUGIN_HELLO_PLUGIN_H_
#define FLUTTER_PLUGIN_HELLO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace hello {

class HelloPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  HelloPlugin();

  virtual ~HelloPlugin();

  // Disallow copy and assign.
  HelloPlugin(const HelloPlugin&) = delete;
  HelloPlugin& operator=(const HelloPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace hello

#endif  // FLUTTER_PLUGIN_HELLO_PLUGIN_H_
