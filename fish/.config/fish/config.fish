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

if test -f /usr/share/autojump/autojump.fish
    source /usr/share/autojump/autojump.fish
end

if test -e /etc/NIXOS
    # include this plugin so nix will work
    # https://github.com/NixOS/nix/issues/1512
    # https://github.com/oh-my-fish/plugin-foreign-env
    #set fish_function_path $fish_function_path $HOME/.config/fish/plugin-foreign-env/functions

    # initialize nix
    #fenv source '/nix/var/nix/profiles/system/etc/profile'
    #fenv source '$HOME/.nix-profile/etc/profile.d/nix.sh'

    any-nix-shell fish --info-right | source
end
