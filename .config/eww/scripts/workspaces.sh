ws_active=$(( $(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name') ))

while true; do
    

    # Get the currently focused workspace
    ws_active=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')
    ws_active=$(( ws_active ))

	echo "(box :class 'workspaces' :space-evenly true :vexpand true ${ws_active})"
	
    # Wait for a workspace event
    i3-msg -t subscribe '[ "workspace" ]' | jq -r --unbuffered '.current.name' > /dev/null
done
