define ->
  'use strict'

  # The routes for the application. This module returns a function.
  # `match` is match method of the Router
  (match) ->
    match '', 'home#show'
    match 'photo/:id', 'home#photo', constraints: {id: /^[0-9]*$/}
    #match 'logout', 'auth#logout'
    #match 'feed', 'feed#show'
    #match 'settings', 'settings#show'
    #match 'auth-callback/', 'auth#callback'

    #users
    #match '@:login', 'users#show'
    #match '@:login/tweets', 'tweets#show'
