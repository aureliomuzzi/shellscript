#!/bin/bash
main()
{
  while true; do
	clear
  	echo ">>>>> Sistema Emulator Android <<<<<"
  	echo "1 - Emulador Android AVD"
	echo "2 - Listar Emuladores Instalados"
	echo "3 - Abrir Android Studio"
  	echo "0 - Sair"

  	echo "Entre com o numero de opção: "
  	read opcao;
  	case $opcao in
  	"1")
    	   emulador_android
  	;;
	"2")
	  cd Android/Sdk/tools
	  echo ">>> Emuladores Instalados <<<"
	  emulator -list-avds
      printf '%sVisualização encerrará em... %s'
      for i in {5..1}
        do
            printf " => %s" $i
            sleep 1
        done
	  cd
	;;
  	"3")
    	  android_studio
  	;;
  	"0")
    	  exit
  	;;
  	esac
 done
}

emulador_android()
{
	pixel_2="Pixel_2_API_30"
	pixel_xl="Pixel_XL_API_33"
	nexus_s="Nexus_S_API_29"

	while true; do
	clear
	echo ">>>>> Selecione uma Opção <<<<<"
	echo "1 - Emulador $pixel_2 "
	echo "2 - Emulador $pixel_xl "
	echo "3 - Emulador $nexus_s "
	echo "0 - Cancelar "
	echo "Entre com o numero da opção: "
	read e;
	    case $e in
		"1")
		  echo "Abrindo Emulador $pixel_2"
		  cd Android/Sdk/tools
	  	  emulator -avd $pixel_2
		  cd
		;;
		"2")
	  	  echo "Abrindo Emulador $pixel_xl"
		  cd Android/Sdk/tools
	  	  emulator -avd $pixel_xl
		  cd
		;;
		"3")
		  echo "Abrindo Emulador $nexus_s"
		  cd Android/Sdk/tools
		  emulator -avd $nexus_s
		  cd
		;;
		"0")
	  	  echo "Cancelado..."
	  	  return main
		;;
	    esac
	done
}

android_studio()
{
	cd android-studio/bin
	echo "Abrindo Android Studio"
	./studio.sh
	cd
	return main
}
main
