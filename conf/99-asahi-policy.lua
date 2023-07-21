-- SPDX-License-Identifier: MIT
-- Wireplumber DSP configuration for Apple Silicon Macs
-- Copyright (C) 2023 The Asahi Linux Contributors

-- J314 (MacBook Pro 14", M1 Pro/Max, 2021)
j314 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.pro-output-1" }
    }
  },
  device_matches = {
    {
      { "device.nick", "=", "MacBook Pro J314" }
    },
  },
  filter_chain = '/usr/share/asahi-audio/j314/graph.json'
}
table.insert(dsp_policy.policy.rules, j314)


-- J316 (MacBook Pro 16", M1 Pro/Max, 2021)
j316 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.pro-output-1" }
    }
  },
  device_matches = {
    {
      { "device.nick", "=", "MacBook Pro J316" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j316/graph.json'
}
table.insert(dsp_policy.policy.rules, j316)


-- Mac minis (all have the same speaker)
mac_mini = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.pro-output-1" }
    }
  },
  device_matches = {
    {
      { "device.nick", "matches", "Mac mini J*" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/mini/graph.json'
}
table.insert(dsp_policy.policy.rules, mac_mini)


-- Hide the raw speaker output from the rest of userspace (DO NOT ENABLE YET)
-- hide_hw = {
--   matches = {
--     {
--       { "node.name", "=", "alsa_output.platform-sound.pro-output-1" }
--     }
--   },
--   properties = {
--     hide = true
--   }
-- }
-- table.insert(dsp_policy.policy.rules, hide_hw)
