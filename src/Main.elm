port module Main exposing (..)
import Browser
import Html exposing (Html, Attribute, div, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Array exposing (..)

-- PORTS
port sendMessage : Model -> Cmd msg
port messageReceiver : (String -> msg) -> Sub msg

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ = messageReceiver Recv

-- MAIN

main : Program () Model Msg
main =
  Browser.element
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model = { msg : String  }


init : () -> ( Model, Cmd Msg )
init flags =
  ( { msg = "" }
  , Cmd.none
  )

-- UPDATE

type Msg = Click | Recv String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Click ->
            (
             model
             , sendMessage { msg = "hello from Elm" }
            )
        Recv message ->
            ( model
            , Cmd.none
            )

-- VIEW

view : Model -> Html Msg
view model =
    div [  onClick Click ] [ text "Click me!" ]
