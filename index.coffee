# This file is part of react-framework
# Copyright (C) 2018-present Dario Giovannetti <dev@dariogiovannetti.net>
# Licensed under MIT
# https://github.com/kynikos/react-framework/blob/master/LICENSE

require('react')
ReactDOM = require('react-dom')
helpers = require('@kynikos/react-helpers')
{createFactory, r} = helpers
createHistory = require('history/createBrowserHistory').default
{Switch, Route, Redirect, withRouter, Link} = require('react-router-dom')
{createStore, combineReducers, applyMiddleware} = require('redux')
{Provider, connect} = require('react-redux')
{ConnectedRouter, routerReducer, routerMiddleware, routerActions, push, replace,
 go, goBack, goForward, LOCATION_CHANGE, CALL_HISTORY_METHOD} =
    require('react-router-redux')
thunk = require('redux-thunk').default
{composeWithDevTools} = require('redux-devtools-extension')
try
    {responsiveStateReducer, createResponsiveStateReducer,
        responsiveStoreEnhancer} = require('redux-responsive')
catch
    responsiveStateReducer = null
    responsiveStoreEnhancer = null

# Other useful modules:
# redux-actions
# reselect
# jss
# styled-jss


module.exports = (reducerMap, {responsiveBreakpoints}) ->
    history = createHistory()

    rootReducerMap = {
        reducerMap...
        # This is expressly required to be called 'router'
        router: routerReducer
    }
    if responsiveStateReducer
        rootReducerMap.browser = responsiveBreakpoints and
            createResponsiveStateReducer(responsiveBreakpoints) or
            responsiveStateReducer

    storeEnhancers = []
    storeEnhancers.push(responsiveStoreEnhancer) if responsiveStoreEnhancer
    storeEnhancers.push(applyMiddleware(
        thunk
        routerMiddleware(history)
    ))

    store = createStore(
        combineReducers(rootReducerMap)
        composeWithDevTools(storeEnhancers...)
    )

    App = (root) ->
        r(Provider
            {store}
            r(ConnectedRouter
                {history}
                root
            )
        )

    return {
        ReactDOM
        App
        Switch: createFactory(Switch)
        Route: createFactory(Route)
        Redirect: createFactory(Redirect)
        withRouter
        connect
        helpers
        Link: createFactory(Link)
        history
        routerActions
        push
        replace
        go
        goBack
        goForward
        LOCATION_CHANGE
        CALL_HISTORY_METHOD
    }
