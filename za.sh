#Ask for username
echo Ingrese el nombre del usuario
read user
#User equal line
user="user: $user"
line_number=$(grep -n "$user" usuarios.txt | cut -f1 -d :)

#Search for password
if  [ -z "$line_number" ]; then
  echo "Usuario no encontrado"
else
  echo Ingresar contraseña
  read passwd
  passwd="password: $passwd"
  line_number=$(( line_number+1 ))
  y=1
  while read line; do
    if [ $y -eq "$line_number" ]; then
      break
    fi
    y=$(( y+1 ))
  done<usuarios.txt
  #check password
  if [ "$line" != "$passwd" ]; then
    echo Contraseña incorrecta
  else
    options=("Listar usuarios regristrados" "Agregar usuario" "Configurar letra de inicio" "Configurar letra de fin" "Configurar letra contenida" "Consultar diccionario" "Ingresar vocal" "Palabras con vocal solicitada" "Algoritmo 1" "Algoritmo 2" "Salir")
    PS3='Elija una opcion escrbibiendo el numero correspondiente '
    select opt in "${options[@]}"
    do
	case $opt in
		"Listar usuarios regristrados")
			grep "user:" usuarios.txt
			;;
		"Agregar usuario")
			echo "Ingrese el nombre del usuario nuevo"
			read nuevo_usuario
			if grep "user: $nuevo_usuario" usuarios.txt; then
			  echo Usuario ya existente
			else
			  echo Ingrese contraseña
			  read nueva_contrasena
			  echo -e "\nuser: $nuevo_usuario\npassword: $nueva_contrasena" >> usuarios.txt
			fi
			;;
		"Configurar letra de inicio")
			echo Ingrese la letra de inicio
			read letra_inicio
			;;
		"Configurar letra de fin")
                        echo Ingrese la letra de fin
                        read letra_fin
                        ;;
		"Configurar letra contenida")
                        echo Ingrese la letra contenida
                        read letra_contenida
                        ;;
		"Consultar diccionario")
			echo consultaste
			;;
		"Ingresar vocal")
			echo ingresaste vocal
			;;
		"Palabras con vocal solicitada")
			echo mostras palabras
			;;
		"Algoritmo 1")
			echo mostrar promedio, mayor y menor
			;;
		"Algoritmo 2")
			echo mostrar si la palabra es capicua
			;;
		"Salir")
			break
			;;
		*)
			echo "Invalid option";;
	esac
    done
  fi
fi
