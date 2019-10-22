import {createElement} from 'react'
import {createBrowserHistory as createHistory} from 'history'
import {applyMiddleware, combineReducers, compose, createStore} from 'redux'
import {Provider as ReactReduxProvider} from 'react-redux'
import {ConnectedRouter, connectRouter, routerMiddleware}
  from 'connected-react-router'
import ReduxThunk from 'redux-thunk'
let composeWithDevTools
try {
  // eslint-disable-next-line global-require
  ({composeWithDevTools} = require('redux-devtools-extension'))
} catch (error) {
  composeWithDevTools = null
}
let createResponsiveStateReducer
let responsiveStateReducer
let responsiveStoreEnhancer
try {
  ({createResponsiveStateReducer, responsiveStateReducer,
    // eslint-disable-next-line global-require
    responsiveStoreEnhancer} = require('redux-responsive'))
} catch (error) {
  createResponsiveStateReducer = null
  responsiveStateReducer = null
  responsiveStoreEnhancer = null
}


export default function initReactFramework(
  reducerMap,
  {
    responsiveBreakpoints,
  },
) {
  const history = createHistory()

  if (responsiveStateReducer) {
    reducerMap.browser = responsiveBreakpoints
      ? createResponsiveStateReducer(responsiveBreakpoints)
      : responsiveStateReducer
  }

  const createRootReducer = (history2) => combineReducers({
    ...reducerMap,
    // This is expressly required to be called 'router'
    router: connectRouter(history2),
  })

  const storeEnhancers = []

  if (responsiveStoreEnhancer) {
    storeEnhancers.push(responsiveStoreEnhancer)
  }

  storeEnhancers.push(
    applyMiddleware(
      ReduxThunk,
      routerMiddleware(history)
    )
  )

  const enhancer = (composeWithDevTools || compose)(...storeEnhancers)

  const store = createStore(
    createRootReducer(history),
    enhancer,
  )

  const App = (root) => createElement(
    ReactReduxProvider,
    {store},
    createElement(
      ConnectedRouter,
      {history},
      root
    )
  )

  return {
    App,
    history,
    store,
  }
}
