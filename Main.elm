module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import List


add : number -> number -> number
add a b =
    a + b

add2 : number -> number
add2 a =
    add 2 a

add3 : number -> number
add3 a =
    add 3 a

-- << - composition operator
-- <| - pipeline operator
add5 : number -> number
add5 a =
    add2 << add3 <| a


type alias Person =
    { firstName : String
    , age : Int
    }

getAgeString : { b | age : a } -> String
getAgeString p =
   toString <| .age p

getPersonString : Person -> String
getPersonString person =
    "(" ++ person.firstName ++ " " ++ getAgeString person ++ ")"

renderPersonListItem : Person -> Html msg
renderPersonListItem person =
    li [] [text <| getPersonString person]

getPeopleString : List Person -> String
getPeopleString pList =
    toString <| List.map (\p -> getPersonString p) pList

renderPeopleList : List Person -> Html msg
renderPeopleList pList =
    ul [] ( List.map (\p -> renderPersonListItem p) pList )

-- record
zdzisek =
    { firstName = "Zdzisek"
    , age = 63
    }

people =
    [ zdzisek
    , { firstName = "Wiesiek", age = 55 }
    ]

-- html_element [attributes] [children]
view =
    div
        [ style
              [ ( "margin", "100px" ) ]
        ]
        [ h1 [] [text "Hello World!"]
        , div [] [text <| toString (add5 1)]
        , div [] [text <| getPeopleString people]
        , div [] [ renderPeopleList people ]
        ]

main =
    view
