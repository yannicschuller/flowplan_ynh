<!--
N.B. : ce README est remplacé par le générateur de README de YunoHost une fois l'application dans le catalogue.
-->

# Flowplan pour YunoHost

[Flowplan](https://flowplan.org) est une alternative open source à Notion et AppFlowy : documents, bases de données, tableaux blancs et journal quotidien dans une seule arborescence de pages, édités ensemble et en direct.

Ce paquet l'installe sur [YunoHost](https://yunohost.org) – avec connexion par les comptes YunoHost (LDAP) et connexion automatique pour les personnes connectées au portail YunoHost (SSO).

**Version incluse :** 0.9.8~ynh1

![Flowplan](./doc/screenshots/flowplan.jpg)

## Installation

```bash
sudo yunohost app install https://github.com/yannicschuller/flowplan_ynh
```

Flowplan a besoin d'un domaine ou sous-domaine dédié. Voir [doc/PRE_INSTALL_fr.md](doc/PRE_INSTALL_fr.md) et [doc/ADMIN_fr.md](doc/ADMIN_fr.md).

## Liens

- Documentation : https://docs.flowplan.org
- Code source : https://github.com/yannicschuller/flowplan
- Signaler un problème du paquet : https://github.com/yannicschuller/flowplan_ynh/issues
