local function kick_user(user_id, channel_id)
  local chat = 'channel#id'..channel_id
  local user = 'user#id'..user_id
  channel_del_user(chat, user, function (data, success, result)
    if success ~= 1 then
      send_msg(data.chat, 'Error while kicking user', ok_cb, nil)
    end
  end, {channel=channel, user=user})
end

local function run (msg, matches)
  local user = msg.from.id
  local channel = msg.to.id

  if msg.to.type ~= 'channel' then
    return "Not a channel group!"
  elseif user == tostring(our_id) then
    --[[ A robot must protect its own existence as long as such protection does
    not conflict with the First or Second Laws. ]]--
    return "I won't kick myself!"
  elseif is_sudo(msg) then
    return "I won't kick an admin!"
  else
    kick_user(user, channel)
  end
end

return {
  description = "Bot kicks user",
  usage = {
    "!kickme"
  },
  patterns = {
    "^!kickme$"
  },
  run = run
}
