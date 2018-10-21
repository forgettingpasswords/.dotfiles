# emacs ansi-term support
if test -n "$EMACS"
    set -x TERM eterm-color
end

# this function may be required
function fish_title
    true
end

fish_vi_key_bindings

set -gx PATH ~/.local/bin $PATH
setxkbmap -option grp:switch,grp:win_space_toggle,grp_led:scroll us,lv -variant alt
