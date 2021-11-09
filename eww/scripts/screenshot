#!/usr/bin/env bash

time=`date +%Y-%m-%d-%I-%M-%S`
geometry=`xrandr | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current'`
dir="`xdg-user-dir PICTURES`/Screenshots"
file="Screenshot_${time}_${geometry}.png"

# notify
notify_user () {
	if [[ -e "$dir/$file" ]]; then
		dunstify -u low --replace=699 -i /usr/share/archcraft/icons/dunst/picture.png "Saved in $dir"
	else
		dunstify -u low --replace=699 -i /usr/share/archcraft/icons/dunst/picture.png "Screenshot Deleted."
	fi
}

# take shots
shotnow () {
	cd ${dir} && sleep 0.5 && maim -u -f png "$file" && viewnior ${dir}/"$file"
	notify_user
}

shotarea () {
	cd ${dir} && maim -u -f png -s -b 2 -c 0.35,0.55,0.85,0.25 -l "$file" && viewnior ${dir}/"$file"
	notify_user
}

if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

chosen="$1"
case $chosen in
    "SCREEN")
		shotnow
        ;;
    "SELECT")
		shotarea
        ;;
esac

