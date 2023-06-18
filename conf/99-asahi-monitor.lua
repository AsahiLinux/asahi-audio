-- SPDX-License-Identifier: MIT
-- Device naming rules for Apple Silicon Macs
-- Copyright (C) 2023 The Asahi Linux Contributors

jack_rename = {
  matches = {
    {
      { "node.name", "=", "alsa_output.platform-sound.pro-output-0" },
      { "alsa.driver_name", "=", "snd_soc_macaudio" }
    }
  },
  apply_properties = {
    ["node.description"] = "Headset Jack"
  }
}
table.insert(alsa_monitor.rules, jack_rename)

mic_rename = {
  matches = {
    {
      { "node.name", "=", "alsa_input.platform-sound.pro-input-0" },
      { "alsa.driver_name", "=", "snd_soc_macaudio" }
    }
  },
  apply_properties = {
    ["node.description"] = "Mic Jack"
  }
}
table.insert(alsa_monitor.rules, mic_rename)

spk_rename = {
  matches = {
    {
      { "node.name", "=", "alsa_output.platform-sound.pro-output-1" },
      { "alsa.driver_name", "=", "snd_soc_macaudio" }
    }
  },
  apply_properties = {
    ["node.description"] = "Raw Speaker Device"
  }
}
table.insert(alsa_monitor.rules, spk_rename)
