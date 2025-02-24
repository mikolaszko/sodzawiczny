module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Data.Content exposing (mainContent)
import Html exposing (Html, div, header, p, text)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model msg =
    Html msg


init : Model msg
init =
    mainContent



-- UPDATE


type Msg
    = Home
    | Other


update : Msg -> Model msg -> Model msg
update msg _ =
    case msg of
        Home ->
            Data.Content.mainContent

        Other ->
            div [] [ text "Other" ]



-- VIEW


view : Model Msg -> Html Msg
view model =
    div [ id "main-container" ]
        [ div [ id "section-container" ]
            [ div [ id "left-section" ]
                [ header [ id "home", class "container" ]
                    [ div [ class "container-content" ]
                        [ div [ class "title decorating-text" ] [ p [] [ text "Home" ] ]
                        , p [ id "home-section-paragraph" ] [ text "Hi! I'm ", p [ class "text-orange" ] [ text "Mikołaj Sodzawiczny" ], text "passionate software engineer from Poland" ]
                        ]
                    ]
                ]
            , div [ id "right-section" ]
                [ div [ id "main-content", class "container h-fill" ]
                    [ div [ class "container-content" ]
                        [ div [ class "outer-paragraph-container" ]
                            [ div [ class "inner-paragraph-container mt-4" ]
                                [ model
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
