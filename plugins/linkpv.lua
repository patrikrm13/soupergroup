do

function run(msg, matches)
       if not is_momod(msg) then
        return "فقط ادمین"
       end
	  local data = load_data(_config.moderation.data)
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
       if not group_link then 
        return "این گروه لینکی نداره اول لینک جدید بساز بعد   /newlink"
       end
         local text = "لینک گروه:
         برای ورود به ساپورت کد  /share    و سپس     /joinsu   را بنویسید\n"..group_link
          send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
end

return {
  patterns = {
    "^[/!]([Ll][iI][nN][Kk][Pp][Vv])$"
  },
  run = run
}

end
