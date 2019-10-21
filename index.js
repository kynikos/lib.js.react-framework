// This file is part of react-framework
// Copyright (C) 2018-present Dario Giovannetti <dev@dariogiovannetti.net>
// Licensed under MIT
// https://github.com/kynikos/react-framework/blob/master/LICENSE

export {
  default,
} from './initReactFramework'

export {
  Component,
  PureComponent,
  memo,
  createElement,
  createFactory,
  cloneElement,
  isValidElement,
  Children,
  Fragment,
  createRef,
  forwardRef,
  lazy,
  Suspense,
  useState,
  useEffect,
  useContext,
  useReducer,
  useCallback,
  useMemo,
  useRef,
  useImperativeHandle,
  useLayoutEffect,
  useDebugValue,
} from 'react'

export {
  render,
  hydrate,
  unmountComponentAtNode,
  findDOMNode,
  createPortal,
} from 'react-dom'

export {
  useHistory,
  useLocation,
  useParams,
  useRouteMatch,
} from 'react-router'

export {
  BrowserRouter,
  HashRouter,
  Link,
  NavLink,
  Prompt,
  MemoryRouter,
  Redirect,
  Route,
  Router,
  StaticRouter,
  Switch,
  matchPath,
  withRouter,
} from 'react-router-dom'

export {
  go,
  goBack,
  goForward,
  push,
  replace,
} from 'connected-react-router'

export {
  connect,
} from 'react-redux'

let MediaQuery
let useMediaQuery
let ResponsiveContext
try {
  ({default: MediaQuery, useMediaQuery, Context: ResponsiveContext} =
    require('react-responsive'))
} catch (error) {
  MediaQuery = null
  useMediaQuery = null
  ResponsiveContext = null
}
export {MediaQuery, useMediaQuery, ResponsiveContext}

export {
  default as createElementExt,
} from '@kynikos/react-helpers'

export {
  createActionsWithMeta,
  combineActions,
  handleAction,
  handleActions,
  createAction,
  createActions,
} from '@kynikos/redux-actions-mod'
