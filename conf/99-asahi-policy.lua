-- SPDX-License-Identifier: MIT
-- Wireplumber DSP configuration for Apple Silicon Macs
-- Copyright (C) 2023 The Asahi Linux Contributors

-- J293 (MacBook Pro 13", M1, 2020)
j293 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J293_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j293/graph.json',
  hide_parent = true
}
-- J493 (MacBook Pro 13", M2, 2022)
table.insert(dsp_policy.policy.rules, j293)
j493 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J493_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j293/graph-j493.json',
  hide_parent = true
}
table.insert(dsp_policy.policy.rules, j493)

--- J313 (MacBook Air 13", M1, 2020)
j313 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J313_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j313/graph.json',
  hide_parent = true
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
  filter_chain = '/usr/share/asahi-audio/j415/graph.json',
  hide_parent = true
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
  filter_chain = '/usr/share/asahi-audio/j314/graph.json',
  hide_parent = true
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
  filter_chain = '/usr/share/asahi-audio/j314/graph-j414.json',
  hide_parent = true
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
  filter_chain = '/usr/share/asahi-audio/j316/graph.json',
  hide_parent = true
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
  filter_chain = '/usr/share/asahi-audio/j316/graph-j416.json',
  hide_parent = true
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
  filter_chain = '/usr/share/asahi-audio/j274/graph.json',
  hide_parent = true
}
table.insert(dsp_policy.policy.rules, j274)
j473 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J473_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j274/graph-j473.json',
  hide_parent = true
}
table.insert(dsp_policy.policy.rules, j473)
j474 = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "=", "alsa_output.platform-sound.HiFi__hw_J474_1__sink" }
    }
  },
  filter_chain = '/usr/share/asahi-audio/j274/graph-j474.json',
  hide_parent = true
}
table.insert(dsp_policy.policy.rules, j474)
