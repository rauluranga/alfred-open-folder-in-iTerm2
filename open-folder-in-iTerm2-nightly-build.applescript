on alfred_script(q)
        if length of (q as string) is greater than 0 then
                set isPush to true
        else
                set isPush to false
        end if
        tell application "Finder"
                try
                        set _cwd to POSIX path of ((folder of (front window)) as alias)
                on error
                        set _cwd to POSIX path of (path to home folder as alias)
                end try
        end tell
		
		if application "iTerm" is running then
    			tell application "iTerm" 
				activate
				tell current session of last window
			   		write text "pushd \"" & _cwd & "\""
		       	end tell
			end tell
		else
			tell application "iTerm" 
				activate
				tell current session of last window
			   		 write text "cd \"" & _cwd & "\""
				end tell
			end tell
		end if
end alfred_script