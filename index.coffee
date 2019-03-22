# This file is part of react-framework
# Copyright (C) 2018-present Dario Giovannetti <dev@dariogiovannetti.net>
# Licensed under MIT
# https://github.com/kynikos/react-framework/blob/master/LICENSE

require('react')
ReactDOM = require('react-dom')
helpers = require('@kynikos/react-helpers')
{createFactory, h} = helpers
createHistory = require('history').createBrowserHistory
{Switch, Route, Redirect, withRouter, Link} = require('react-router-dom')
{createStore, combineReducers, applyMiddleware} = require('redux')
{Provider, connect} = require('react-redux')
{ConnectedRouter, connectRouter, routerMiddleware, push, replace, go, goBack,
    goForward} = require('connected-react-router')
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

    if responsiveStateReducer
        reducerMap.browser = responsiveBreakpoints and
            createResponsiveStateReducer(responsiveBreakpoints) or
            responsiveStateReducer

    createRootReducer = (history) -> combineReducers({
        reducerMap...
        # This is expressly required to be called 'router'
        router: connectRouter(history)
    })

    storeEnhancers = []
    storeEnhancers.push(responsiveStoreEnhancer) if responsiveStoreEnhancer
    storeEnhancers.push(applyMiddleware(
        thunk
        routerMiddleware(history)
    ))

    store = createStore(
        createRootReducer(history)
        composeWithDevTools(storeEnhancers...)
    )

    App = (root) ->
        h(Provider
            {store}
            h(ConnectedRouter
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
        store
        withRouter
        connect
        helpers
        Link: createFactory(Link)
        history
        push
        replace
        go
        goBack
        goForward
    }
