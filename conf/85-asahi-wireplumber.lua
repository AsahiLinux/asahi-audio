-- Clamp util to keep Wireplumber on ecores
-- mod_args = {
--   ["nice.level"] = -11,
--   ["uclamp.min"] = 0,
--   ["uclamp.max"] = 64
-- }
-- load_pw_module("rt", mod_args)

-- Load our policy to force the raw speaker volume to 100%
load_script("policy-asahi.lua")
