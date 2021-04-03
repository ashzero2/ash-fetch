#colors
bold="$(tput bold)"
magenta="$(tput setaf 5)"
green="$(tput setaf 2)"
white="$(tput setaf 7)"
blue="$(tput setaf 4)"
red="$(tput setaf 1)"
black="$(tput setaf 0)"
yellow="$(tput setaf 3)"
cyan="$(tput setaf 6)"

c0="${reset}${black}"
c1="${reset}${red}"
c2="${reset}${green}"
c3="${reset}${yellow}"
c4="${reset}${blue}"
c5="${reset}${magenta}"
c6="${reset}${cyan}"
c7="${reset}${white}"
c10="${reset}${bold}${green}"

# values
user="$(whoami)@$(hostname) on $( cat /sys/devices/virtual/dmi/id/product_family)"
wm="$(echo $DESKTOP_SESSION)"
pkg="$(xbps-query -l | wc -l ) pkgs"
kernel="$(uname -r)"
uptime="$(uptime -p | sed 's/up //')"
shell="$(echo $SHELL)"
ram_total="$(cat /proc/meminfo | grep MemTotal | awk '{print $2/1024}')"
r_total=${ram_total%.*}
ram="$(free | grep Mem | awk '{print $3 / 1024}')"
r_used=${ram%.*}

## OUTPUT

cat <<EOF               
${c2}    _______     ${c10}$user
${c2} _ \______ -    ${c7}--------------------
${c2}| \  ___  \ |   ${c10}  ${c4}» ${c7}$(echo "void linux")
${c2}| | /   \ | |   ${c10}  ${c4}» ${c7}$kernel
${c2}| | \___/ | |   ${c10}  ${c4}» ${c7}$pkg
${c2}| \______ \_|   ${c10}  ${c4}» ${c7}$uptime
${c2} -_______\      ${c10}  ${c4}» ${c7}$wm
                ${c10}  ${c4}» ${c7}$shell
${c0}󰓒 ${c1}󰓒 ${c2}󰓒 ${c3}󰓒 ${c4}󰓒 ${c5}󰓒 ${c6}󰓒   ${c10}  ${c4}» ${c7}$r_used MiB / $r_total MiB 
EOF

