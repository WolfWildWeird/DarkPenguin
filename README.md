# DarkPenguin



**DarkPenguin** est un script Bash simple conçu pour configurer et appliquer un thème sombre (par défaut `CrosAdapta`) sur les applications GTK et Qt au sein du conteneur Linux de ChromeOS (machine virtuelle *Penguin*).

## Fonctionnalités

*   Vérifie que le script est bien exécuté dans l'environnement ChromeOS.
*   Configure automatiquement les variables d'environnement nécessaires pour GTK et Qt (`GTK_THEME`, `GTK2_RC_FILES`, `QT_STYLE_OVERRIDE`).
*   Crée/met à jour les fichiers de configuration de GTK 3 (`~/.config/gtk-3.0/settings.ini` et `~/.config/gtk-3.22/settings.ini`).
*   Modifie les paramètres `gsettings` pour forcer le mode sombre (`prefer-dark`) de l'interface GNOME.

## Prérequis

*   Une machine sous **ChromeOS** avec le support Linux (Crostini/Penguin) activé.
*   Par défaut, le thème `CrosAdapta` sera utilisé, il doit être installé au préalable via `sudo apt install cros-adapta` ; vous pouvez aussi choisir le thème souhaité présent dans l'un des répertoires suivants :
    *   `/usr/share/themes/`
    *   `~/.local/share/themes/`
    *   `~/.themes/` (compatibility)

## Utilisation

1.  Rendez le script exécutable :
    ```bash
    chmod +x darkpenguin.sh
    ```

2.  Exécutez le script :
    ```bash
    ./darkpenguin.sh
    ```

3.  Une fois le script terminé, vous devrez redémarrer votre conteneur Linux (Penguin) pour que tous les changements prennent effet. 
Vous pouvez l'arrêter en faisant un clic droit sur l'icône du terminal Linux dans la barre des tâches de ChromeOS puis en sélectionnant "Arrêter Linux".

## Personnalisation

Vous pouvez modifier les variables suivantes en début de script pour utiliser un autre thème ou désactiver le mode sombre :

```bash
THEME=NomDeVotreTheme
THEME_DARK=true # Mettre à 'false' ou commenter pour un thème clair
```


## Todo

- [ ] Créér un fichier `README.en.md`
- [ ] Copie de  `/usr/share/themes/CrosAdapta/gtk-2.0/` vers `${HOME}/.local/share/themes/CrosAdapta/gtk-2.0/` afin de "noircirs" les variables contenu dans `colors.rc` 
- [ ] ... terminer cette liste ...

## Licence

Ce projet est distribué sous licence Copyleft (GNU GPLv3). Vous êtes libre de l'utiliser, de le modifier et de le redistribuer tant que vous conservez cette même licence.

**Auteur :** [@WolfWildWeird](https://github.com/WolfWildWeird)  
