type Bolillas = [Int]

duenioDelBingo = "Perez"
ultimaBolilla = 17

jugador1  = ("Juan Perez", [5, 23, 35, 17, 56, 80])
jugador2  = ("Mariano Moreno", [5, 23, 35, 16, 56, 80])

cantidadCorrectaNumeros = 6

cantidadLetrasApellido::Int
cantidadLetrasApellido = length duenioDelBingo

cantidadNumeros:: Bolillas -> Bool
cantidadNumeros bolillas = length bolillas == cantidadCorrectaNumeros

ordenNumeros:: Bolillas -> Bool
ordenNumeros bolillas = (maximum bolillas == last bolillas) && (minimum bolillas == head bolillas)

jugadaValida::(String, Bolillas) -> Bool
jugadaValida (nombre, bolillas) = ordenNumeros bolillas && cantidadNumeros bolillas

tieneUltimaBolilla:: (String, Bolillas) -> Int -> Bool
tieneUltimaBolilla (nombre, bolillas) indice | (last(take indice bolillas) == ultimaBolilla) = True
											 | (indice == length bolillas) = False
											 | otherwise = tieneUltimaBolilla (nombre, bolillas) (indice + 1)
										 
esFamiliar::(String, Bolillas) -> Bool
esFamiliar (nombre, bolillas) = (drop cantidadLetrasApellido nombre == duenioDelBingo)

ganaBingo::(String, Bolillas) -> Bool
ganaBingo jugador = jugadaValida jugador && tieneUltimaBolilla jugador 1 && esFamiliar jugador

--Tuve problemas definiendo las funciones arriba, por eso está comentado. Parece ser que hay un problema con la definición de las Listas. Este jueves consultaría cómo se hace.
