module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Html exposing (Html, div, header, p, text)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = Home
    | Other


update : Msg -> Model -> Model
update msg model =
    case msg of
        Home ->
            model + 1

        Other ->
            model - 1



-- VIEW


view : Model -> Html Msg
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
            , div [ id "right-section" ] []
            ]
        ]
