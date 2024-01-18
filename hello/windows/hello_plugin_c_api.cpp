#include "include/hello/hello_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "hello_plugin.h"

void HelloPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  hello::HelloPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
