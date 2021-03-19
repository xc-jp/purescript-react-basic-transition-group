module React.Basic.Transition
  ( TransitionProps
  , EnterEventHandler
  , enterEventHandler
  , ExitEventHandler
  , exitEventHandler
  ) where

import Data.Unit (Unit)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn1, mkEffectFn2)
import Web.HTML.HTMLElement (HTMLElement)

type EnterEventHandler
  = EffectFn2 HTMLElement Boolean Unit

type ExitEventHandler
  = EffectFn1 HTMLElement Unit

enterEventHandler :: (HTMLElement -> Boolean -> Effect Unit) -> EnterEventHandler
enterEventHandler = mkEffectFn2

exitEventHandler :: (HTMLElement -> Effect Unit) -> ExitEventHandler
exitEventHandler = mkEffectFn1

type TransitionProps r
  = ( in :: Boolean -- ^ Default: `false`
    , mountOnEnter :: Boolean -- ^ Default: `false`
    , unmountOnExit :: Boolean -- ^ Default: `false`
    , appear :: Boolean -- ^ Default: `false`
    , enter :: Boolean -- ^ Default: `true`
    , exit :: Boolean -- ^ Default: `true`
    , onEnter :: EnterEventHandler
    , onEntering :: EnterEventHandler
    , onEntered :: EnterEventHandler
    , onExit :: ExitEventHandler
    , onExiting :: ExitEventHandler
    , onExited :: ExitEventHandler
    | r
    )
