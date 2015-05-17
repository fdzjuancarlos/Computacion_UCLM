module Main where
import Data.Char
import Prelude
import Data.List

digit::Char -> Bool
digit x = isDigit x

uppercase::Char -> Bool
uppercase x = isUpper x

lowercase::Char -> Bool
lowercase x = isLower x

letter:: Char -> Bool
letter x = isLetter x

charofdigit:: Int -> Char
charofdigit 0 = '0'
charofdigit 1 = '1'
charofdigit 2 = '2'
charofdigit 3 = '3'
charofdigit 4 = '4'
charofdigit 5 = '5'
charofdigit 6 = '6'
charofdigit 7 = '7'
charofdigit 8 = '8'
charofdigit 9 = '9'

among:: Eq a => a -> [a] -> Bool
among x [] = False
among x (z:l) = if x==z then True else among x l

stringcopy :: Int -> String -> String
stringcopy x s | x==0 = ""
		| x>0 = s ++ stringcopy (x-1) s
		| x<0 = error("No se aceptan valores negativos")

strcop :: Int -> String -> String
strcop 0 s = ""
strcop x s = if x>0 then (s++ strcop (x-1) s) else error("No se aceptan valores negativos")
