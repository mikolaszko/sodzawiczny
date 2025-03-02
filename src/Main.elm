module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Data.Content exposing (mainContent)
import Data.CtagsReact exposing (content)
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
    | Ctags
    | BareCase
    | Other


update : Msg -> Model msg -> Model msg
update msg _ =
    case msg of
        Home ->
            Data.Content.mainContent

        Ctags ->
            Data.CtagsReact.content

        BareCase ->
            div [] [ text "its going to be a banger" ]

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
                        [ div [ class "title decorating-text", onClick Home ] [ p [] [ text "Home" ] ]
                        , p [ id "home-section-paragraph" ] [ text "Hi! I'm ", p [ class "text-orange" ] [ text "Mikołaj Sodzawiczny" ], text "passionate software engineer from Poland" ]
                        ]
                    ]
                , div [ id "blog", class "container" ]
                    [ div [ class "container-content" ]
                        [ div [ class "title decorating-text" ] [ p [] [ text "Blog Posts" ] ]
                        , div [ class "ui-list" ]
                            [ div []
                                [ div [ onClick Ctags ] [ text "Stubborn Go To Definitions in Nvim (oh god this needs a rework)" ]
                                ]
                            , div []
                                [ div [ onClick BearCase ] [ text "Bear Case" ]
                                ]
                            , div [] []
                            , div [] []
                            , div [] []
                            , div [] []
                            , div [] []
                            ]
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
