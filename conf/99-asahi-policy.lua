-- SPDX-License-Identifier: MIT
-- Wireplumber DSP configuration for Apple Silicon Macs
-- Copyright (C) 2023 The Asahi Linux Contributors

-- J313 (MacBook Air 13", M1, 2020)
j313 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J313_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j313/graph.json'
}
table.insert(dsp_policy.policy.rules, j313)

-- J415 (MacBook Air 15", M2, 2023)
j415 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J415_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j415/graph.json'
}
table.insert(dsp_policy.policy.rules, j415)

-- J314 (MacBook Pro 14", M1 Pro/Max, 2021)
j314 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J314_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j314/graph.json'
}
table.insert(dsp_policy.policy.rules, j314)
-- J414 (MacBook Pro 14", M2 Pro/Max, 2023)
j414 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J414_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j314/graph-j414.json'
}
table.insert(dsp_policy.policy.rules, j414)

-- J316 (MacBook Pro 16", M1 Pro/Max, 2021)
j316 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J316_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j316/graph.json'
}
table.insert(dsp_policy.policy.rules, j316)
-- J416 (MacBook Pro 16", M2 Pro/Max, 2023)
j416 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J416_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j316/graph-j416.json'
}
table.insert(dsp_policy.policy.rules, j416)

-- Mac minis (all have the same speaker)
j274 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J274_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j274/graph.json'
}
table.insert(dsp_policy.policy.rules, j274)
j473 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J473_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j274/graph-j473.json'
}
table.insert(dsp_policy.policy.rules, j473)
j474 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J474_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j274/graph-j474.json'
}
table.insert(dsp_policy.policy.rules, j474)

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
