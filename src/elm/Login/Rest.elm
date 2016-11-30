module Login.Rest exposing (..)

import HttpBuilder exposing (..)
import Http exposing (..)
import Json.Decode as Decode exposing (Decoder, list, string, field, decodeString, at)
import Login.Messages exposing (..)


-- HTTP


authenticate : String -> Cmd Msg
authenticate token =
    HttpBuilder.get "https://now.authentication.autcoding.com"
        |> withHeader "Accept" "application/json"
        |> withHeader "Authorization" ("" ++ token)
        |> withExpect (Http.expectJson deploymentToken)
        |> HttpBuilder.send Login_Response



-- DECODERS


deploymentToken : Decode.Decoder String
deploymentToken =
    (Decode.field "token" Decode.string)
