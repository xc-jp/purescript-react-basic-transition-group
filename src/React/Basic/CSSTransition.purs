module React.Basic.CSSTransition
  ( ClassNames
  , classNames
  , CSSTransitionProps
  , cssTransition
  ) where

import Data.Semigroup ((<>))
import React.Basic (JSX, ReactComponent, element)
import React.Basic.Transition (TransitionProps)
import Prim.Row (class Union)

foreign import cssTransitionImpl :: forall props. ReactComponent props

type ClassNames
  = { appear :: String
    , appearActive :: String
    , enter :: String
    , enterActive :: String
    , enterDone :: String
    , exit :: String
    , exitActive :: String
    , exitDone :: String
    }

classNames :: String -> ClassNames
classNames prefix =
  { appear: prefix <> "-appear"
  , appearActive: prefix <> "-appear-active"
  , enter: prefix <> "-enter"
  , enterActive: prefix <> "-enter-active"
  , enterDone: prefix <> "-enter-done"
  , exit: prefix <> "-exit"
  , exitActive: prefix <> "-exit-active"
  , exitDone: prefix <> "-exit-done"
  }

type ComponentProps
  = ( key :: String
    , children :: Array JSX
    )

type CSSTransitionProps r
  = ( classNames :: ClassNames
    | r
    )

cssTransition ::
  forall attrs attrs_.
  Union attrs attrs_ (TransitionProps (CSSTransitionProps ComponentProps)) =>
  Record attrs -> JSX
cssTransition = element cssTransitionImpl
