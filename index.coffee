# React Framework
# Copyright (C) 2018 Dario Giovannetti <dev@dariogiovannetti.net>
#
# This file is part of React Helpers.
#
# React Helpers is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# React Helpers is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with React Helpers.  If not, see <http://www.gnu.org/licenses/>.

require('react')
ReactDOM = require('react-dom')
helpers = require('../react-helpers/index')
{createFactory, r} = helpers
{Router, Route} = require('react-router')
{createStore, combineReducers, applyMiddleware} = require('redux')
# Require redux-actions-mod directly in the app code, since this module hasn't been
# initialized yet when actions must be created
# require('../redux-actions-mod/index')
{Provider, connect} = require('react-redux')
{routerReducer, routerMiddleware, push} = require('react-router-redux')
{composeWithDevTools} = require('redux-devtools-extension')
{createBrowserHistory} = require('history')


module.exports = (config) ->
    actionCreators = {}
    reducersMap = {}

    for stateKey, {actions, reducers} of config
        reducersMap[stateKey] = combineReducers(reducers)
        for type, actionCreator of actions
            if actionCreators[type]?
                throw new Error("Duplicated action creator: #{type}")
            actionCreators[type] = actionCreator

    history = createBrowserHistory()
    store = createStore(
        combineReducers({
            reducersMap...  # noqa
            router: routerReducer
        })
        composeWithDevTools(
            applyMiddleware(
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
        connect
        actions: actionCreators
        helpers
        history
        push
    }
