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
  filter_chain = '{"node.description": "MacBook Pro J314 Speakers", "media.name": "MacBook Pro J314 Speakers", "filter.graph": {"nodes": [{"type": "lv2", "plugin": "http://lsp-plug.in/plugins/lv2/dyna_processor_stereo", "name": "compressor", "control":{"g_in": 1, "g_out": 1, "pause": 1, "sct": 0, "scm": 1, "sla": 20.0, "scl": 0, "scs": 0, "scr": 15.0, "scp": 1, "cm": 0, "atd": 0.0, "rtd": 100.0, "pe0": 1, "tl0": 0.514, "gl0": 0.158489, "kn0": 0.251189, "ae0": 1, "al0": 0.188365, "at0": 10.0, "re0": 1, "rl0": 0.398107, "rt0": 100.0, "pe1": 1, "tl1": 0.000557, "gl1": 0.000684, "kn1": 0.063100, "ae1": 1, "al1": 0.005623, "at0": 10.0, "re0": 1, "rl1": 0.000371, "rt`": 100.0, "llr": 0.15, "hlr": 15.5, "omk": 1, "cdr": 0, "cwt": 1, "slv": 0, "elv": 0, "grv": 0, "ilv_l": 0, "olv_l": 0, "ilv_r": 0, "olv_r": 0}}, {"type": "builtin", "label": "convolver", "name": "convLT", "config": {"filename": ["/usr/share/asahi-audio/j314/tweeters-44.wav","/usr/share/asahi-audio/j314/tweeters-48.wav","/usr/share/asahi-audio/j314/tweeters-96.wav","/usr/share/asahi-audio/j314/tweeters-192.wav"], "channel": 0}}, {"type": "builtin", "label": "convolver", "name": "convRT", "config": {"filename":["/usr/share/asahi-audio/j314/tweeters-441.wav","/usr/share/asahi-audio/j314/tweeters-48.wav","/usr/share/asahi-audio/j314/tweeters-96.wav","/usr/share/asahi-audio/j314/tweeters-192.wav"], "channel": 0}}, {"type": "builtin", "label": "convolver", "name": "convLW", "config": {"filename":["/usr/share/asahi-audio/j314/woofers-441.wav","/usr/share/asahi-audio/j314/woofers-48.wav","/usr/share/asahi-audio/j314/woofers-96.wav","/usr/share/asahi-audio/j314/woofers-192.wav"], "channel": 0}}, {"type": "builtin", "label": "convolver", "name": "convRW", "config": {"filename":["/usr/share/asahi-audio/j314/woofers-441.wav","/usr/share/asahi-audio/j314/woofers-48.wav","/usr/share/asahi-audio/j314/woofers-96.wav","/usr/share/asahi-audio/j314/woofers-192.wav"], "channel": 0}}, {"type": "builtin", "label": "convolver", "name": "convLW2", "config": {"filename":["/usr/share/asahi-audio/j314/woofers-441.wav","/usr/share/asahi-audio/j314/woofers-48.wav","/usr/share/asahi-audio/j314/woofers-96.wav","/usr/share/asahi-audio/j314/woofers-192.wav"], "channel": 0}}, {"type": "builtin", "label": "convolver", "name": "convRW2", "config": {"filename":["/usr/share/asahi-audio/j314/woofers-441.wav","/usr/share/asahi-audio/j314/woofers-48.wav","/usr/share/asahi-audio/j314/woofers-96.wav","/usr/share/asahi-audio/j314/woofers-192.wav"], "channel": 0}}], "links": [{"output": "compressor:out_l", "input": "convLT:In"}, {"output": "compressor:out_l", "input": "convLW:In"}, {"output": "compressor:out_l", "input": "convLW2:In"}, {"output": "compressor:out_r", "input": "convRT:In"}, {"output": "compressor:out_r", "input": "convRW:In"}, {"output": "compressor:out_r", "input": "convRW2:In"}], "inputs": ["compressor:in_l", "compressor:in_r"], "outputs": ["convLW:Out", "convRW:Out", "convLT:Out", "convRT:Out", "convLW2:Out", "convRW2:Out"]}, "capture.props": {"node.name": "audio_input.j31x-convolver", "media.class": "Audio/Sink", "audio.channels": "2", "audio.position": ["FL", "FR"]}, "playback.props": {"target.object": "alsa_output.platform-sound.pro-output-1", "node.passive": "true", "audio.channels": "6", "audio.position": ["AUX0", "AUX1", "AUX2", "AUX3", "AUX4", "AUX5"]}}'
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
  filter_chain = '{"node.description": "MacBook Pro J316 Speakers", "media.name": "MacBook Pro J316 Speakers", "filter.graph": {"nodes": [{"type": "lv2", "plugin": "http://lsp-plug.in/plugins/lv2/mb_compressor_stereo", "name": "compressor", "control":{"mode": 1, "bypass": 0, "g_in": 1, "g_out": 1, "g_dry": 0, "g_wet": 1, "bsel": 0, "flt": 1, "ife_l": 0, "ofe_l": 0, "ife_r": 0, "ofe_r": 0, "cbe_0": 1, "ce_0": 1, "al_0": 0.145, "at_0": 0, "rrl_0": 0, "rt_0": 750, "cr_0": 5.25, "kn_0": 0.251197, "sla_0": 10.0, "cbe_1": 1, "ce_1": 1, "sf_1": 160, "al_1": 0.135, "at_1": 0, "rrl_1": 0, "rt_1": 750, "cr_1": 5.5, "kn_1": 0.20, "sla_1": 10.0, "cbe_2": 1, "sf_2": 400, "ce_2": 0, "sla_2": 10.0, "cbe_7": 1, "ce_7": 1, "sf_7": 2000, "al_7": 0.45, "at_7": 0, "rrl_7": 0, "rt_7": 750, "cr_7": 3.25, "kn_7": 0.251197, "sla_7": 10.0, "cbe_3": 0, "cbe_4": 0, "cbe_5": 0, "cbe_6": 0, "bs_0": 0, "bm_0": 0}}, {"type": "builtin", "label": "convolver", "name": "convLT", "config": {"filename": ["/usr/share/asahi-audio/j314/tweeters-441.wav","/usr/share/asahi-audio/j314/tweeters-48.wav","/usr/share/asahi-audio/j314/tweeters-96.wav","/usr/share/asahi-audio/j314/tweeters-192.wav"], "channel": 0}}, {"type": "builtin", "label": "convolver", "name": "convRT", "config": {"filename":["/usr/share/asahi-audio/j314/tweeters-441.wav","/usr/share/asahi-audio/j314/tweeters-48.wav","/usr/share/asahi-audio/j314/tweeters-96.wav","/usr/share/asahi-audio/j314/tweeters-192.wav"], "channel": 0}}, {"type": "builtin", "label": "convolver", "name": "convLW", "config": {"filename":["/usr/share/asahi-audio/j314/woofers-441.wav","/usr/share/asahi-audio/j314/woofers-48.wav","/usr/share/asahi-audio/j314/woofers-96.wav","/usr/share/asahi-audio/j314/woofers-192.wav"], "channel": 0}}, {"type": "builtin", "label": "convolver", "name": "convRW", "config": {"filename":["/usr/share/asahi-audio/j314/woofers-441.wav","/usr/share/asahi-audio/j314/woofers-48.wav","/usr/share/asahi-audio/j314/woofers-96.wav","/usr/share/asahi-audio/j314/woofers-192.wav"], "channel": 0}}, {"type": "builtin", "label": "convolver", "name": "convLW2", "config": {"filename":["/usr/share/asahi-audio/j314/woofers-441.wav","/usr/share/asahi-audio/j314/woofers-48.wav","/usr/share/asahi-audio/j314/woofers-96.wav","/usr/share/asahi-audio/j314/woofers-192.wav"], "channel": 0}}, {"type": "builtin", "label": "convolver", "name": "convRW2", "config": {"filename":["/usr/share/asahi-audio/j314/woofers-441.wav","/usr/share/asahi-audio/j314/woofers-48.wav","/usr/share/asahi-audio/j314/woofers-96.wav","/usr/share/asahi-audio/j314/woofers-192.wav"], "channel": 0}}], "links": [{"output": "compressor:out_l", "input": "convLT:In"}, {"output": "compressor:out_l", "input": "convLW:In"}, {"output": "compressor:out_l", "input": "convLW2:In"}, {"output": "compressor:out_r", "input": "convRT:In"}, {"output": "compressor:out_r", "input": "convRW:In"}, {"output": "compressor:out_r", "input": "convRW2:In"}], "inputs": ["compressor:in_l", "compressor:in_r"], "outputs": ["convLW:Out", "convRW:Out", "convLT:Out", "convRT:Out", "convLW2:Out", "convRW2:Out"]}, "capture.props": {"node.name": "audio_input.j31x-convolver", "media.class": "Audio/Sink", "audio.channels": "2", "audio.position": ["FL", "FR"]}, "playback.props": {"target.object": "alsa_output.platform-sound.pro-output-1", "node.passive": "true", "audio.channels": "6", "audio.position": ["AUX0", "AUX1", "AUX2", "AUX3", "AUX4", "AUX5"]}}'
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
  filter_chain = '{"node.description": "Mac mini Speaker", "media.name": "Mac mini Speaker", "filter.graph": {"nodes": [{"type": "builtin", "label": "mixer", "name": "mix", "control": {"Gain 1": "0.5", "Gain 2": "0.5"}}, {"type": "builtin", "label": "convolver", "name": "conv", "config": {"filename": ["/usr/share/asahi-audio/mini/441.wav", "/usr/share/asahi-audio/mini/48.wav", "/usr/share/asahi-audio/mini/96.wav", "/usr/share/asahi-audio/mini/192.wav"], "channel": "0"}}], "links": [{"output": "mix:Out", "input": "conv:In"}], "inputs": ["mix:In 1", "mix:In 2"], "outputs": ["conv:Out"]}, "capture.props": {"node.name": "audio_input.mini-convolver", "media.class": "Audio/Sink", "audio.channels": "2", "audio.position": ["FL", "FR"]}, "playback.props": {"node.target": "alsa_output.platform-sound.pro-output-1", "node.passive": "true", "audio.channels": "1", "audio.position": ["AUX0"]}'
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
