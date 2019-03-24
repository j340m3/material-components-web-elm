module Demo.TextFields exposing (Model, Msg(..), defaultModel, update, view)

import Demo.Helper.Hero as Hero
import Demo.Helper.ResourceLink as ResourceLink
import Demo.Page as Page exposing (Page)
import Dict exposing (Dict)
import Html exposing (Html, text)
import Html.Attributes
import Html.Events
import Material.TextField as TextField exposing (textField, textFieldConfig)
import Material.TextField.HelperText exposing (helperText, helperTextConfig)
import Material.Typography as Typography


type alias Model =
    {}


defaultModel : Model
defaultModel =
    {}


type Msg
    = NoOp


update : (Msg -> m) -> Msg -> Model -> ( Model, Cmd m )
update lift msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


heroTextFieldsContainer : List (Html.Attribute m) -> List (Html m) -> Html m
heroTextFieldsContainer options =
    Html.div
        (Html.Attributes.class "hero-text-field-container"
            :: Html.Attributes.style "display" "flex"
            :: Html.Attributes.style "flex" "1 1 100%"
            :: Html.Attributes.style "justify-content" "space-around"
            :: Html.Attributes.style "flex-wrap" "wrap"
            :: options
        )


heroTextFieldContainer : List (Html.Attribute m) -> List (Html m) -> Html m
heroTextFieldContainer options =
    Html.div
        (Html.Attributes.class "text-field-container"
            :: Html.Attributes.style "min-width" "200px"
            :: Html.Attributes.style "padding" "20px"
            :: options
        )


heroTextFields : (Msg -> m) -> Model -> Html m
heroTextFields lift model =
    heroTextFieldContainer []
        [ textFieldContainer []
            [ textField { textFieldConfig | label = "Standard" }
            , textField { textFieldConfig | label = "Standard", outlined = True }
            ]
        ]


textFieldRow : List (Html.Attribute m) -> List (Html m) -> Html m
textFieldRow options =
    Html.div
        (Html.Attributes.class "text-field-row"
            :: Html.Attributes.style "display" "flex"
            :: Html.Attributes.style "align-items" "flex-start"
            :: Html.Attributes.style "justify-content" "space-between"
            :: Html.Attributes.style "flex-wrap" "wrap"
            :: options
        )


textFieldContainer : List (Html.Attribute m) -> List (Html m) -> Html m
textFieldContainer options =
    Html.div
        (Html.Attributes.class "text-field-container"
            :: Html.Attributes.style "min-width" "200px"
            :: options
        )


helperText_ : Html m
helperText_ =
    helperText { helperTextConfig | persistent = True } "Helper Text"


filledTextFields : (Msg -> m) -> Model -> Html m
filledTextFields lift model =
    textFieldRow []
        [ textFieldContainer []
            [ textField { textFieldConfig | label = "Standard" }
            , helperText_
            ]
        , textFieldContainer []
            [ textField { textFieldConfig | label = "Standard" }
            , helperText_
            ]
        , textFieldContainer []
            [ textField { textFieldConfig | label = "Standard" }
            , helperText_
            ]
        ]


outlinedTextFields : (Msg -> m) -> Model -> Html m
outlinedTextFields lift model =
    textFieldRow []
        [ textFieldContainer []
            [ textField { textFieldConfig | label = "Standard", outlined = True }
            , helperText_
            ]
        , textFieldContainer []
            [ textField { textFieldConfig | label = "Standard", outlined = True }
            , helperText_
            ]
        , textFieldContainer []
            [ textField { textFieldConfig | label = "Standard", outlined = True }
            , helperText_
            ]
        ]


shapedFilledTextFields : (Msg -> m) -> Model -> Html m
shapedFilledTextFields lift model =
    textFieldRow []
        [ textFieldContainer []
            [ textField
                { textFieldConfig
                    | label = "Standard"
                    , additionalAttributes =
                        [ Html.Attributes.style "border-radius" "16px 16px 0 0" ]
                }
            , helperText_
            ]
        , textFieldContainer []
            [ textField
                { textFieldConfig
                    | label = "Standard"
                    , additionalAttributes =
                        [ Html.Attributes.style "border-radius" "16px 16px 0 0" ]
                }
            , helperText_
            ]
        , textFieldContainer []
            [ textField
                { textFieldConfig
                    | label = "Standard"
                    , additionalAttributes =
                        [ Html.Attributes.style "border-radius" "16px 16px 0 0" ]
                }
            , helperText_
            ]
        ]


shapedOutlinedTextFields : (Msg -> m) -> Model -> Html m
shapedOutlinedTextFields lift model =
    textFieldRow []
        [ textFieldContainer []
            [ textField { textFieldConfig | label = "Standard", outlined = True }
            , helperText_
            ]
        , textFieldContainer []
            [ textField { textFieldConfig | label = "Standard", outlined = True }
            , helperText_
            ]
        , textFieldContainer []
            [ textField { textFieldConfig | label = "Standard", outlined = True }
            , helperText_
            ]
        ]


fullwidthTextField : (Msg -> m) -> Model -> Html m
fullwidthTextField lift model =
    textFieldContainer []
        [ textField { textFieldConfig | label = "Standard", fullwidth = True }
        , helperText_
        ]


textareaTextField : (Msg -> m) -> Model -> Html m
textareaTextField lift model =
    textFieldContainer []
        [ textField
            { textFieldConfig | label = "Standard", textarea = True, outlined = True }
        , helperText_
        ]


textFieldRowFullwidth : List (Html.Attribute m) -> List (Html m) -> Html m
textFieldRowFullwidth options =
    Html.div
        (Html.Attributes.class "text-field-row text-field-row--fullwidth"
            :: Html.Attributes.style "display" "block"
            :: options
        )


fullwidthTextareaTextField : (Msg -> m) -> Model -> Html m
fullwidthTextareaTextField lift model =
    textFieldRowFullwidth []
        [ textFieldContainer []
            [ textField
                { textFieldConfig
                    | label = "Standard"
                    , textarea = True
                    , fullwidth = True
                    , outlined = True
                }
            , helperText_
            ]
        ]


view : (Msg -> m) -> Page m -> Model -> Html m
view lift page model =
    page.body "Text Field"
        "Text fields allow users to input, edit, and select text. Text fields typically reside in forms but can appear in other places, like dialog boxes and search."
        [ Hero.view [] [ heroTextFields lift model ]
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
            { link = "https://material.io/components/web/catalog/input-controls/text-field/"
            , title = "Documentation"
            , icon = "images/ic_drive_document_24px.svg"
            , altText = "Documentation icon"
            }
        , ResourceLink.view
            { link = "https://github.com/material-components/material-components-web/tree/master/packages/mdc-textfield"
            , title = "Source Code (Material Components Web)"
            , icon = "images/ic_code_24px.svg"
            , altText = "Source Code"
            }
        , Page.demos
            [ Html.h3 [ Typography.subtitle1 ] [ text "Filled" ]
            , filledTextFields lift model
            , Html.h3 [ Typography.subtitle1 ] [ text "Shaped Filled" ]
            , shapedFilledTextFields lift model
            , Html.h3 [ Typography.subtitle1 ] [ text "Outlined" ]
            , outlinedTextFields lift model
            , Html.h3 [ Typography.subtitle1 ] [ text "Shaped Outlined (TODO)" ]
            , shapedOutlinedTextFields lift model
            , Html.h3 [ Typography.subtitle1 ] [ text "Textarea" ]
            , textareaTextField lift model
            , Html.h3 [ Typography.subtitle1 ] [ text "Full Width" ]
            , fullwidthTextField lift model
            , Html.h3 [ Typography.subtitle1 ] [ text "Full Width Textarea" ]
            , fullwidthTextareaTextField lift model
            ]
        ]