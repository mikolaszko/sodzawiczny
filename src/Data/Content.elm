module Data.Content exposing (mainContent)

import Html exposing (Html, div, header, p, text)


mainContent : Html msg
mainContent =
    div [] [ text "I am from Another File and this is actually the beginning of dynamic content loading" ]
