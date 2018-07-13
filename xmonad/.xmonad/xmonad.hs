import           Data.Monoid
import           Data.Ratio
import           DBus
import           XMonad
import           XMonad.Hooks.DynamicLog
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
myBar = "xmobar"

fadeLevel = 0.7

bar = statusBar myBar myPP toggleKey

emptyString _ = ""
myPP = xmobarPP { ppTitle = xmobarColor "darkgreen"  "" . shorten 30
                , ppLayout = emptyString
                , ppHidden = emptyString
                , ppHiddenNoWindows = emptyString
                , ppVisible = emptyString
                }

toggleKey XConfig { XMonad.modMask = modMask } = (modMask, xK_F9)

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

-- toggleDocksHook :: Int -> KeySym -> Event -> X All
-- toggleDocksHook to ks ( KeyEvent { ev_event_display = d
--                                  , ev_event_type    = et
--                                  , ev_keycode       = ekc
--                                  , ev_time          = etime
--                                  } ) =
--         io (keysymToKeycode d ks) >>= toggleDocks >> return (All True)
--     where
--     toggleDocks kc
--         | ekc == kc && et == keyPress = do
--             safeSendSignal ["Reveal 0", "TogglePersistent"]
--         | ekc == kc && et == keyRelease = do
--             safeSendSignal [ "TogglePersistent"
--                            , "Hide 0"
--                            ]
--         | otherwise = return ()

--     safeSendSignal s = catchX (io $ sendSignal s) (return ())
--     sendSignal    = withSession . callSignal
--     -- Maybe not needed??
--     withSession mc = connectSession >>= \c -> callNoReply c mc >> disconnect c
--     callSignal :: [String] -> MethodCall
--     callSignal s = ( methodCall
--                      ( objectPath_    "/org/Xmobar/Control" )
--                      ( interfaceName_ "org.Xmobar.Control"  )
--                      ( memberName_    "SendSignal"          )
--                    ) { methodCallDestination = Just $ busName_ "org.Xmobar.Control"
--                      , methodCallBody        = map toVariant s
--                      }

-- toggleDocksHook _ _ _ = return (All True)

main = xmonad =<< (bar $ def
    { terminal = myTerminal
    , modMask = mod4Mask
    , startupHook = myStartup
    , layoutHook = myLayoutHooks
    } `additionalKeysP` myCustomKeys
                  )
