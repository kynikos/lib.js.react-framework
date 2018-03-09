# This file is part of react-framework
# Copyright (C) 2018-present Dario Giovannetti <dev@dariogiovannetti.net>
# Licensed under MIT
# https://github.com/kynikos/react-framework/blob/master/LICENSE

require('react')
ReactDOM = require('react-dom')
helpers = require('@kynikos/react-helpers')
{createFactory, r} = helpers
{Router, Route, withRouter, Link} = require('react-router-dom')
{createStore, combineReducers, applyMiddleware} = require('redux')
{Provider, connect} = require('react-redux')
{routerReducer, routerMiddleware, push} = require('react-router-redux')
thunk = require('redux-thunk').default
{composeWithDevTools} = require('redux-devtools-extension')
{createBrowserHistory} = require('history')
try
    {responsiveStateReducer, responsiveStoreEnhancer} =
        require('redux-responsive')
catch
    responsiveStateReducer = null
    responsiveStoreEnhancer = null

# Other useful modules:
# redux-actions
# reselect
# jss
# react-bootstrap


module.exports = (reducerMap) ->
    rootReducerMap = {
        reducerMap...
        router: routerReducer
    }
    if responsiveStateReducer
        rootReducerMap.browser = responsiveStateReducer

    storeEnhancers = []
    storeEnhancers.push(responsiveStoreEnhancer) if responsiveStoreEnhancer
    storeEnhancers.push(applyMiddleware(
        thunk
        routerMiddleware(history)
    ))

    history = createBrowserHistory()

    store = createStore(
        combineReducers(rootReducerMap)
        composeWithDevTools(storeEnhancers...)
    )

    App = (root) ->
        r(
            Provider
            {store}
            r(
                Router
                {history}
                root
            )
        )

    return {
        ReactDOM
        App
        Route: createFactory(Route)
        withRouter
        connect
        helpers
        Link: createFactory(Link)
        history
        push
    }
