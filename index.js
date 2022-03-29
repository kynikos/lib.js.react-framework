// This file is part of react-framework
// Copyright (C) 2018-present Dario Giovannetti <dev@dariogiovannetti.net>
// Licensed under MIT
// https://github.com/kynikos/react-framework/blob/master/LICENSE

// TODO[expand]: Other useful modules:
// Also search for "react|redux ecosystem" etc.
// https://redux.js.org/introduction/ecosystem
// jss
// styled-jss
// redux-form
// react-break
// react-responsive
// react-breakpoints
// redux-saga
// redux-observable
// redux-persist
// redux-offline
// redux-repatch
// reselect
// repatch

// TODO[expand]: UI frameworks:
// https://github.com/mui-org/material-ui
// https://github.com/ant-design/ant-design
// https://github.com/react-bootstrap/react-bootstrap
// https://github.com/palantir/blueprint
// https://github.com/react-toolbox/react-toolbox
// https://github.com/gabrielbull/react-desktop
// https://github.com/Semantic-Org/Semantic-UI-React
// https://github.com/elementalui/elemental
// https://github.com/reactstrap/reactstrap
// https://github.com/grommet/grommet
// https://github.com/OfficeDev/office-ui-fabric-react
// https://github.com/nikgraf/belle
// https://github.com/tleunen/react-mdl
// https://github.com/mdbootstrap/bootstrap-material-design
// https://github.com/mlaursen/react-md
// https://github.com/Lobos/react-ui
// https://github.com/cloudflare/cf-ui
// https://github.com/JetBrains/ring-ui
// https://github.com/react-materialize/react-materialize
// https://github.com/digiaonline/react-foundation
// https://github.com/bokuweb/re-bulma
// https://github.com/primefaces/primereact

// TODO[expand]: CSS frameworks:
// https://github.com/twbs/bootstrap
// https://github.com/Semantic-Org/Semantic-UI
// https://github.com/Dogfalo/materialize
// https://github.com/zurb/foundation-sites
// https://github.com/jgthms/bulma
// https://github.com/pure-css/pure
// https://github.com/material-components/material-components-web/
// https://github.com/imperavi/kube

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
  createContext,
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
  // TODO[setup]: is this the same as history.push?
  push,
  replace,
} from 'connected-react-router'

export {
  combineReducers,
} from 'redux'

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
  createElementExt,
  createFactoryExt,
} from '@kynikos/react-helpers'

export {
  createActionsWithMeta,
  combineActions,
  handleAction,
  handleActions,
  createAction,
  createActions,
} from '@kynikos/redux-actions-mod'
