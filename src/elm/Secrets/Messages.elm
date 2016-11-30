module Secrets.Messages exposing (..)

import Http exposing (..)
import Secrets.Types exposing (Secret)


type Msg
    = Fetch_Secrets_Response (Result Http.Error (List Secret))