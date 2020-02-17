#!/bin/bash
echo 'Mot de passe nécessaire.'
sudo echo "Supression de l'ancienne version de Shadow..."
if [ -d $HOME/.shadow/ ]
then
  if [ -f $HOME/.shadow/Shadow.AppImage ]
    then
      rm $HOME/.shadow/Shadow.AppImage
      echo "Supression de l'ancienne version de Shadow terminée"
  fi
else
  mkdir $HOME/.shadow
fi

wget https://shadow.tech/frfr/shadow-apps/telecharger-shadow-app-pour-ubuntu -O $HOME/.shadow/Shadow.AppImage
sudo chmod a+x $HOME/.shadow/Shadow.AppImage
if [ -f $HOME/.shadow/Shadow.AppImage ]
then
  echo 'Téléchargement de la nouvelle version terminé.'
  echo 'Vérification de la configuration...'
  if [ -f /usr/share/applications/shadow.desktop ]
    then
      echo 'Mise à jour du fichier existant.'
      if [ -f /usr/share/applications/shadow.desktop ]
        then sudo rm /usr/share/applications/shadow.desktop
      fi
      if [ -f $HOME/.local/share/applications/shadow.desktop ]
        then sudo rm $HOME/.local/share/applications/shadow.desktop
      fi
  fi
  if [ -f /usr/share/icons/shadow.xpm ]
    then sudo rm /usr/share/icons/shadow.xpm
  fi 
  echo "Mise en place de l'icone Shadow"
  sudo cp ./shadow.xpm /usr/share/icons/
  echo 'Mise en place du fichier .desktop...'
  sudo cp $HOME/.shadow/shadow.desktop /usr/share/applications/shadow.desktop
  sudo cp $HOME/.shadow/shadow.desktop $HOME/.local/share/applications/shadow.desktop
  echo 'Installation terminée.'
  exit 0
else
  echo 'Un problème a eut lieu durant le téléchargement...'
  exit 1
fi
