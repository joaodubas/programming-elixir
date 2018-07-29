rs = with {:ok, file} = File.open("passwd"),
          content = IO.read(file, :all),  # NOTE: same as above
	  :ok = File.close(file),
	  [_, uid, gid] <- Regex.run(~r/^xx:.*?:(\d+):(\d+)/m, content)
     do
          "Group: #{gid} ¦ User: #{uid}"
     end
IO.puts rs
IO.puts inspect(rs)
