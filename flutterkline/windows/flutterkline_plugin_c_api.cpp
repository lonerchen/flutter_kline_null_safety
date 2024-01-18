#include "include/flutterkline/flutterkline_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutterkline_plugin.h"

void FlutterklinePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutterkline::FlutterklinePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
