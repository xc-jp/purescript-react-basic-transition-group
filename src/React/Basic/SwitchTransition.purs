module React.Basic.SwitchTransition (switchTransition) where

import React.Basic (JSX, ReactComponent, element)
import Prim.Row (class Union)

type ComponentProps
  = ( key :: String
    , children :: Array JSX
    )

foreign import switchTransitionImpl :: forall props. ReactComponent props

switchTransition ::
  forall attrs attrs_.
  Union attrs attrs_ ComponentProps =>
  Record attrs -> JSX
switchTransition = element switchTransitionImpl
