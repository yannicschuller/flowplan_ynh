### Emplacements

- Fichiers de la version : `__INSTALL_DIR__` (remplacés à chaque mise à jour)
- Données – base SQLite, fichiers envoyés et clés de l'instance : `__DATA_DIR__`
- Réglages : `__INSTALL_DIR__/.env`, écrit par le paquet à l'installation et à la mise à jour
- Journal : `/var/log/__APP__/__APP__.log`

### Connexion

- **Comptes YunoHost :** Flowplan vérifie le nom d'utilisateur ou l'adresse e-mail et le mot de passe dans l'annuaire LDAP de YunoHost – uniquement pour les utilisateurs ayant la permission pour cette application. Chaque heure, Flowplan synchronise ces comptes (nom, e-mail, groupes) et désactive ceux qui ont disparu de l'annuaire.
- **Connexion par le portail :** les personnes connectées au portail YunoHost sont connectées automatiquement à Flowplan (SSOwat transmet l'utilisateur dans des en-têtes qu'un navigateur ne peut pas falsifier). Se déconnecter de Flowplan mène à la déconnexion du portail.
- **Administrateurs :** les membres du groupe YunoHost `admins`. D'autres administrateurs peuvent être nommés dans l'administration de Flowplan.
- Les comptes qui ne sont pas des utilisateurs YunoHost (e-mail et mot de passe, invités) fonctionnent comme d'habitude.

### Réglages personnels

Les modifications de `__INSTALL_DIR__/.env` sont écrasées à la prochaine mise à jour. Pour vos propres réglages (IA, notifications push, stockage S3, OIDC …), ajoutez plutôt un fichier systemd, par exemple `/etc/systemd/system/__APP__.service.d/override.conf` :

```ini
[Service]
Environment="FLOWPLAN_UPDATE_CHECK=off"
```

puis `systemctl daemon-reload && systemctl restart __APP__`. Toutes les variables : https://docs.flowplan.org/en/environment-variables

### Sauvegardes

La sauvegarde YunoHost inclut le dossier de données avec une copie cohérente de la base de données, faite pendant que Flowplan continue de tourner. Les sauvegardes propres à Flowplan (Administration → Sauvegardes) peuvent être utilisées en plus.
