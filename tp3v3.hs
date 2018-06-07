type Jugador = (String, Bolillas)
type Bolillas = [Int]

duenioDelBingo = "Perez"
ultimaBolilla = 17

jugador1::Jugador
jugador1  = ("Juan Perez", [5, 23, 35, 17, 56, 80])
jugador2::Jugador
jugador2  = ("Mariano Moreno", [5, 23, 35, 16, 56, 80])

cantidadCorrectaNumeros = 6

cantidadLetrasApellido::Int
cantidadLetrasApellido = length duenioDelBingo

cantidadNumeros:: Bolillas -> Bool
cantidadNumeros bolillas = length bolillas == cantidadCorrectaNumeros

ordenNumeros:: Bolillas -> Bool
ordenNumeros bolillas = (maximum bolillas == last bolillas) && (minimum bolillas == head bolillas)

jugadaValida::Jugador -> Bool
jugadaValida (nombre, bolillas) = ordenNumeros bolillas && cantidadNumeros bolillas

tieneUltimaBolilla:: Jugador -> Int -> Bool
tieneUltimaBolilla (nombre, bolillas) indice | (last(take indice bolillas) == ultimaBolilla) = True
											 | (indice == length bolillas) = False
											 | otherwise = tieneUltimaBolilla (nombre, bolillas) (indice + 1)
										 
esFamiliar::Jugador -> Bool
esFamiliar (nombre, bolillas) = (drop cantidadLetrasApellido nombre == duenioDelBingo)

ganaBingo::Jugador -> Bool
ganaBingo jugador = jugadaValida jugador && tieneUltimaBolilla jugador 1 && esFamiliar jugador

--Ahora si funciona todo.
