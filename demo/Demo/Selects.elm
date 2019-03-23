module Demo.Selects exposing (Model, Msg(..), defaultModel, subscriptions, update, view)

import Array
import Demo.Helper.Hero as Hero
import Demo.Helper.ResourceLink as ResourceLink
import Demo.Page as Page exposing (Page)
import Dict exposing (Dict)
import Html exposing (Html, text)
import Html.Attributes
import Html.Events
import Material.Select as Select
import Material.Typography as Typography


type alias Model =
    { selects : Dict String String
    }


defaultModel : Model
defaultModel =
    { selects = Dict.empty
    }


type Msg
    = Select String String


update : (Msg -> m) -> Msg -> Model -> ( Model, Cmd m )
update lift msg model =
    case msg of
        Select index value ->
            ( { model | selects = Dict.insert index value model.selects }, Cmd.none )


items : List (Html m)
items =
    [ Select.option [ Select.value "Apple" ] [ text "Apple" ]
    , Select.option [ Select.value "Orange" ] [ text "Orange" ]
    , Select.option [ Select.value "Banana" ] [ text "Banana" ]
    ]


heroSelect : (Msg -> m) -> Model -> Html m
heroSelect lift model =
    Select.view lift
        "selects-hero-select"
        model.mdc
        [ Select.label "Fruit" ]
        items


filledSelect : (Msg -> m) -> Model -> Html m
filledSelect lift model =
    Select.view lift
        "selects-filled-select"
        model.mdc
        [ Select.label "Fruit" ]
        items


outlinedSelect : (Msg -> m) -> Model -> Html m
outlinedSelect lift model =
    Select.view lift
        "selects-outlined-select"
        model.mdc
        [ Select.label "Fruit"
        , Select.outlined
        ]
        items


shapedFilledSelect : (Msg -> m) -> Model -> Html m
shapedFilledSelect lift model =
    Select.view lift
        "selects-shaped-filled-select"
        model.mdc
        [ Select.label "Fruit"
        , Html.Attributes.style "border-radius" "17.92px 17.92px 0 0"
        ]
        items


shapedOutlinedSelect : (Msg -> m) -> Model -> Html m
shapedOutlinedSelect lift model =
    Select.view lift
        "selects-shaped-outlined-select"
        model.mdc
        [ Select.label "Fruit"
        , Select.outlined

        -- TODO:
        -- , Select.nativeControl
        --     [ Html.Attributes.style "border-radius" "28px"
        --     , Html.Attributes.style "padding-left" "32px"
        --     , Html.Attributes.style "padding-right" "52px"
        --     ]
        ]
        items


view : (Msg -> m) -> Page m -> Model -> Html m
view lift page model =
    page.body "Select"
        "Selects allow users to select from a single-option menu. It functions as a wrapper around the browser's native <select> element."
        [ Hero.view [] [ heroSelect lift model ]
        , Html.h2
            [ Typography.headline6
            , Html.Attributes.style "border-bottom" "1px solid rgba(0,0,0,.87)"
            ]
            [ text "Resources"
            ]
        , ResourceLink.view
            { link = "https://material.io/go/design-text-fields"
            , title = "Material Design Guidelines"
            , icon = "images/material.svg"
            , altText = "Material Design Guidelines icon"
            }
        , ResourceLink.view
            { link = "https://material.io/components/web/catalog/input-controls/select-menus/"
            , title = "Documentation"
            , icon = "images/ic_drive_document_24px.svg"
            , altText = "Documentation icon"
            }
        , ResourceLink.view
            { link = "https://github.com/material-components/material-components-web/tree/master/packages/mdc-select"
            , title = "Source Code (Material Components Web)"
            , icon = "images/ic_code_24px.svg"
            , altText = "Source Code"
            }
        , Page.demos
            [ Html.h3 [ Typography.subtitle1 ] [ text "Filled" ]
            , filledSelect lift model
            , Html.h3 [ Typography.subtitle1 ] [ text "Outlined" ]
            , outlinedSelect lift model
            , Html.h3 [ Typography.subtitle1 ] [ text "Shaped Filled" ]
            , shapedFilledSelect lift model
            , Html.h3 [ Typography.subtitle1 ] [ text "Shaped Outlined" ]
            , shapedOutlinedSelect lift model
            ]
        ]


subscriptions : (Msg -> m) -> Model -> Sub m
subscriptions lift model =
    Sub.none
