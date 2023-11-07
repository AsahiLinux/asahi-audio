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
