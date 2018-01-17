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
{Router, Route, withRouter, Link} = require('react-router-dom')
{createStore, combineReducers, applyMiddleware} = require('redux')
{Provider, connect} = require('react-redux')
{routerReducer, routerMiddleware, push} = require('react-router-redux')
thunk = require('redux-thunk').default
{composeWithDevTools} = require('redux-devtools-extension')
{createBrowserHistory} = require('history')


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
