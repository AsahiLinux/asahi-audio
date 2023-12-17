local config = ... or {}

seen_devices = {}

function parseParam(param, id)
  local route = param:parse()
  if route.pod_type == "Object" and route.object_id == id then
    return route.properties
  else
    return nil
  end
end

function handleDevice(device)
  local profile = nil

  for p in device:iterate_params("Profile") do
    profile = parseParam(p, "Profile")
  end
  if profile == nil or profile.name ~= "HiFi" then
    return
  end

  for p in device:iterate_params("Route") do
    local route = parseParam(p, "Route")
    if not route or (route.description ~= "Speakers" and route.description ~= "Speaker") then
      goto skip_route
    end

    local pr = route.props.properties
    if pr.channelVolumes[1] ~= 1.0 or pr.mute == true then
      local props = {
        "Spa:Pod:Object:Param:Props", "Route",
        mute = false,
        channelVolumes = Pod.Array({ "Spa:Float", 1.0 })
      }
      local param = Pod.Object {
        "Spa:Pod:Object:Param:Route", "Route",
        index = route.index,
        device = route.device,
        props = Pod.Object(props),
      }
      Log.warning(param, "Forcing Speaker route props: " .. tostring(device))
      device:set_param("Route", param)
    end
    ::skip_route::
  end
end

om = ObjectManager {
  Interest {
    type = "device",
    Constraint { "alsa.driver_name", "equals", "snd_soc_macaudio", type = "pw" },
  }
}

om:connect("objects-changed", function (om)
  local new_seen_devices = {}
  for device in om:iterate() do
    if not seen_devices[device["bound-id"]] then
      seen_devices[device["bound-id"]] = true
      device:connect("params-changed", handleDevice)
      handleDevice(device)
    end
    new_seen_devices[device["bound-id"]] = true
  end
  seen_devices = new_seen_devices
end)

om:activate()
