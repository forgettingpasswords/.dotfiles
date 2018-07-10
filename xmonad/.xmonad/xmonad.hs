import           Data.Ratio
import           XMonad
import           XMonad.Hooks.FadeInactive
import           XMonad.Layout.Circle
import           XMonad.Layout.NoBorders    (noBorders)
import           XMonad.Layout.ThreeColumns
import           XMonad.Util.EZConfig       (additionalKeysP)
import           XMonad.Util.SpawnOnce

myTerminal = "urxvt"
emacsDaemon = "emacs --daemon &"
background = "~/.fehbg &"
locker = "light-locker &"
compton = "compton --config ~/.config/compton.conf -b"

fadeLevel = 0.7

myLayoutHooks = tallLayout ||| columnLayout ||| borderlessCircle

tallLayout = noBorders ((Tall 1 (3 % 100) (1 % 2)))
columnLayout = noBorders (ThreeColMid 1 (3/100) (1/3))
borderlessCircle = noBorders (Circle)

myCustomKeys = [ ("M-<F1>", spawn "light-locker-command -l")
               , ("M-<F2>", spawn "emacsclient -c")
               , ("M-<F3>", spawn "qutebrowser")
               , ("M-<F4>", spawn "networkmanager_dmenu")
               , ("M-<F7>", spawn "gnome-screenshot -a")
               , ("M-<F6>", spawn "gnome-screenshot -w")
               , ("M-<F5>", spawn "gnome-screenshot")
               , ("M-<F8>", spawn "comptroller-exe -c")
               , ("M-<KP_Subtract>", spawn "bash ~/.local/bin/reduce-brightness.sh -d")
               , ("M-<KP_Add>", spawn "bash ~/.local/bin/reduce-brightness.sh -u")
               , ("M-p", spawn "rofi -show drun")
               , ("M-S-p", spawn "rofi -show drun")
               ]

myStartup = do
  spawnOnce background
  spawnOnce compton
  spawnOnce locker
  spawnOnce myTerminal
  spawnOnce emacsDaemon

matchAny :: String -> Query Bool
matchAny x = foldr ((<||>) . (=? x)) (return False) [className, title, name, role]

-- Match against @WM_NAME@.
name :: Query String
name = stringProperty "WM_CLASS"

-- Match against @WM_WINDOW_ROLE@.
role :: Query String
role = stringProperty "WM_WINDOW_ROLE"

main = do
  xmonad $ def
    { terminal = myTerminal
    , modMask = mod4Mask
    , startupHook = myStartup
    , layoutHook = myLayoutHooks
    } `additionalKeysP` myCustomKeys
