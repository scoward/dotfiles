import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.FloatSnap
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO

myManageHook = composeAll
    [ className =? "Pidgin" --> doShift "9"
    ]

startup :: X ()
startup = do
    spawn "pidof pidgin || pidgin"
    spawn "pidof kupfer || kupfer"

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
    xmonad $ defaultConfig 
        { manageHook = manageDocks <+> myManageHook
                                   <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                            { ppOutput = hPutStrLn xmproc 
                            ,  ppTitle = xmobarColor "green" "" .shorten 50 }
        , startupHook = startup
        , modMask = mod4Mask
        } `additionalKeysP` myKeys

-- Key Bindings
myKeys = 
         [ ("M-<Left>"  , withFocused $ snapMove L Nothing  )
         , ("M-<Right>" , withFocused $ snapMove R Nothing  )
         , ("M-<Up>"    , withFocused $ snapMove U Nothing  )
         , ("M-<Down>"  , withFocused $ snapMove D Nothing  )
         , ("M-S-<Left>" , withFocused $ snapShrink R Nothing)
         , ("M-S-<Right>", withFocused $ snapGrow   R Nothing)
         , ("M-S-<Up>"   , withFocused $ snapShrink D Nothing)
         , ("M-S-<Down>" , withFocused $ snapGrow   D Nothing)

         , ("M-u",      spawnHere "google-chrome")
         , ("M-f",      spawnHere "firefox")
         , ("M-S-l",    spawn "gnome-screensaver-command -l")

         , ("M-w", nextScreen)
         , ("M-s", swapNextScreen)
         , ("M-e", shiftNextScreen)
         , ("M-z", toggleWS)
         ]
