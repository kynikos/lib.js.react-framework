# This file is part of react-framework
# Copyright (C) 2018-present Dario Giovannetti <dev@dariogiovannetti.net>
# Licensed under MIT
# https://github.com/kynikos/react-framework/blob/master/LICENSE

require('react')
ReactDOM = require('react-dom')
helpers = require('../react-helpers/index')
{createFactory, r} = helpers
{Router, Route, withRouter, Link} = require('react-router-dom')
{createStore, combineReducers, applyMiddleware} = require('redux')
{Provider, connect} = require('react-redux')
{routerReducer, routerMiddleware, push} = require('react-router-redux')
thunk = require('redux-thunk').default
{composeWithDevTools} = require('redux-devtools-extension')
{createBrowserHistory} = require('history')

# Other useful modules:
# redux-actions
# reselect
# jss
# react-bootstrap


module.exports = (reducerMap) ->
    history = createBrowserHistory()
    store = createStore(
        combineReducers({
            reducerMap...  # noqa
            router: routerReducer
        })
        composeWithDevTools(
            applyMiddleware(
                thunk
                routerMiddleware(history)
            )
        )
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
