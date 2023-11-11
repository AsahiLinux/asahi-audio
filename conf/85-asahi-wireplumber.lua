-- Override pw module loading func so we can pass args
function load_pw_module(m, a)
  assert(type(m) == "string", "module name is mandatory, bail out");
  if not components[m] then
    components[m] = { "libpipewire-module-" .. m, type = "pw_module", args = a }
  end
end

-- Clamp util to keep Wireplumber on ecores
mod_args = {
  ["nice.level"] = -11,
  ["uclamp.min"] = 0,
  ["uclamp.max"] = 64
}
load_pw_module("rt", mod_args)

ratelimit = {
  matches = {
    {
      { "media.class", "matches", "*/Sink" },
      { "node.name", "matches", "alsa_output.platform-sound.HiFi__hw_J*_1__sink" }
    }
  },
  apply_properties = {
    -- First entry is the fallback, hence 48k first
    ["audio.allowed-rates"] = "48000,44100",
  }
}
table.insert(alsa_monitor.rules, ratelimit)

-- Load our policy to force the raw speaker volume to 100%
load_script("policy-asahi.lua")
