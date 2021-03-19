module React.Basic.Transition
  ( TransitionProps
  , EnterEventHandler
  , enterEventHandler
  , ExitEventHandler
  , exitEventHandler
  , Timeout
  , timeout
  ) where

import Data.Time.Duration (Milliseconds)
import Data.Unit (Unit)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn1, mkEffectFn2)
import Web.Event.EventTarget (EventListener, EventTarget)
import Web.HTML.HTMLElement (HTMLElement)

type EnterEventHandler
  = EffectFn2 HTMLElement Boolean Unit

type ExitEventHandler
  = EffectFn1 HTMLElement Unit

enterEventHandler :: (HTMLElement -> Boolean -> Effect Unit) -> EnterEventHandler
enterEventHandler = mkEffectFn2

exitEventHandler :: (HTMLElement -> Effect Unit) -> ExitEventHandler
exitEventHandler = mkEffectFn1

type Timeout
  = { "enter?" :: Milliseconds
    , "exit?" :: Milliseconds
    }

timeout :: Milliseconds -> Timeout
timeout x = { "enter?": x, "exit?": x }

type TransitionProps r
  = ( in :: Boolean -- ^ Default: `false`
    , mountOnEnter :: Boolean -- ^ Default: `false`
    , unmountOnExit :: Boolean -- ^ Default: `false`
    , appear :: Boolean -- ^ Default: `false`
    , enter :: Boolean -- ^ Default: `true`
    , exit :: Boolean -- ^ Default: `true`
    , timeout :: Timeout -- ^ Required if `addEndListener` isn't present
    , addEndListener :: EffectFn2 EventTarget EventListener Unit
    , onEnter :: EnterEventHandler
    , onEntering :: EnterEventHandler
    , onEntered :: EnterEventHandler
    , onExit :: ExitEventHandler
    , onExiting :: ExitEventHandler
    , onExited :: ExitEventHandler
    | r
    )
