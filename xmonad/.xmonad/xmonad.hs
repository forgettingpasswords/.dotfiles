import           Data.Char                   (toLower)
import           Data.Function               (on)
import           Data.List                   (isInfixOf)
import           Data.Monoid
import           Data.Ratio
-- import           DBus                        (MethodCall, busName_,
--                                               interfaceName_, memberName_,
--                                               methodCall, methodCallBody,
--                                               methodCallDestination,
--                                               objectPath_, toVariant)
-- import           DBus.Client                 (callNoReply, connectSession,
--                                               disconnect)
import           XMonad
import           XMonad.Actions.Search      hiding (Query)
import           XMonad.Config.Prime        (composeAll, (-->), (<+>), (=?))
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.FadeInactive
import           XMonad.Hooks.ManageHelpers (composeOne, doCenterFloat,
                                             doHideIgnore, isDialog, (-?>))
import           XMonad.Layout.Circle
import           XMonad.Layout.MultiColumns (multiCol)
import           XMonad.Layout.NoBorders
import           XMonad.Layout.ThreeColumns
import           XMonad.Prompt
import           XMonad.Prompt.Man           (manPrompt)
import           XMonad.Prompt.RunOrRaise    (runOrRaisePrompt)
import           XMonad.Prompt.Window
import           XMonad.Prompt.Workspace     (workspacePrompt)
import           XMonad.Util.EZConfig        (additionalKeysP)
import           XMonad.Util.SpawnOnce

myTerminal = "termite"
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

myLayoutHooks = tallLayout ||| realColumnLayout ||| columnLayout ||| borderlessCircle

mod_b :: String -> String
mod_b = ("M-b " ++)

realColumnLayout = noBorders (multiCol [1] 1 0.01 0.25)
tallLayout = noBorders ((Tall 1 (3 % 100) (1 % 2)))
columnLayout = noBorders (ThreeColMid 1 (3/100) (1/3))
borderlessCircle = noBorders (Circle)

myCustomKeys = [ ("M-<F1>", spawn "physlock -sm")
               , ("M-<F2>", spawn "SHELL=/bin/bash emacsclient -c")
               , ("M-<F3>", spawn "qutebrowser")
               , ("M-<F4>", spawn "networkmanager_dmenu")
               , ("M-<F7>", spawn "gnome-screenshot -a")
               , ("M-<F6>", spawn "gnome-screenshot -w")
               , ("M-<F5>", spawn "gnome-screenshot")
               , ("M-<F8>", spawn "~/.local/bin/comptroller-exe -Oano 99")
               , ("M-<KP_Subtract>", spawn "bash ~/.local/bin/reduce-brightness.sh -d")
               , ("M-<KP_Add>", spawn "bash ~/.local/bin/reduce-brightness.sh -u")
               , ("M-p", spawn "rofi -show drun")
               , ("M-S-p", spawn "rofi -show drun")
               , ("M-z", spawn "rofi-pass")
               , ("M-<Tab>", wsWindowSwitchPrompt)
               , ("M-S-<Tab>", windowSwitchPrompt)
               , (mod_b "g", searchPrompt google)
               , (mod_b "h", searchPrompt hackage)
               , (mod_b "H", searchPrompt hoogle)
               , (mod_b "m", manlyPrompt)
               -- , (mod_b "w", workingSpacePrompt)
               , (mod_b "t", runningPrompt)
               ]

myStartup = do
  spawnOnce background
  spawnOnce compton
  spawnOnce locker
  spawnOnce myTerminal
  spawnOnce emacsDaemon

myXPConfig :: XPConfig
myXPConfig = def
  { bgColor = "#002b36"
  , fgColor = "#657b83"
  , height = 60
  , font = "xft:Hasklig:size=14"
  , completionKey = (noModMask, xK_Tab)
  , searchPredicate = isInfixOf `on` map toLower
  }

searchPrompt = promptSearchBrowser myXPConfig "qutebrowser"
windowSwitchPrompt = windowPrompt myXPConfig Goto allWindows
wsWindowSwitchPrompt = windowPrompt myXPConfig Goto wsWindows
manlyPrompt = manPrompt myXPConfig
runningPrompt = runOrRaisePrompt myXPConfig
-- TODO Could be interesting to have a password storage like this
-- http://hackage.haskell.org/package/xmonad-contrib-0.13/docs/XMonad-Prompt-Pass.html
-- workingSpacePrompt = workspacePrompt myXPConfig (windows . shift)

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

-- myDocksEventHook :: Event -> X All
-- myDocksEventHook e = do
--     when (et == mapNotify || et == unmapNotify) $
--         whenX ((not `fmap` (isClient w)) <&&> runQuery checkDock w) refresh
--     return (All True)
--     where w  = ev_window e
--           et = ev_event_type e

myManageHook =
  composeOne
  [ isDialog -?> doCenterFloat
  ]
  <+> composeAll
  [ title =? "Wine System Tray"	--> doHideIgnore
  ]

main = (bar (ewmh $ def
              { terminal 		= myTerminal
              , modMask 		= mod4Mask
              , manageHook 	= myManageHook
              , layoutHook 	= noBorders $ myLayoutHooks
              , startupHook 	= myStartup
              } `additionalKeysP` myCustomKeys
            )) >>= xmonad
