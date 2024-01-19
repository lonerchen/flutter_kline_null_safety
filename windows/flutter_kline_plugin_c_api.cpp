#include "include/flutter_kline/flutter_kline_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_kline_plugin.h"

void FlutterKlinePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_kline::FlutterKlinePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
