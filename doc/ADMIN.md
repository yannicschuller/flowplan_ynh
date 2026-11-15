### Where things are

- Release files: `__INSTALL_DIR__` (replaced on every upgrade)
- Data – the SQLite database, uploads and the instance's keys: `__DATA_DIR__`
- Settings: `__INSTALL_DIR__/.env`, written by the package on install and upgrade
- Log: `/var/log/__APP__/__APP__.log`

### Sign-in

- **YunoHost accounts:** Flowplan checks user name or e-mail and password against YunoHost's LDAP directory – only for users with the permission for this app. Every hour Flowplan syncs these accounts (name, e-mail, groups) and disables those that disappeared from the directory.
- **Portal sign-in:** whoever is logged in on the YunoHost portal is signed in to Flowplan automatically (SSOwat passes the user in headers that browsers can't fake). Signing out of Flowplan leads to the portal's sign-out.
- **Administrators:** members of the YunoHost group `admins`. Further admins can be appointed in Flowplan's administration.
- Accounts that are not YunoHost users (e-mail and password, guests) keep working as usual.

### Own settings

Changes in `__INSTALL_DIR__/.env` are overwritten by the next upgrade. For settings of your own (AI, push notifications, S3 storage, OIDC …), add a systemd drop-in instead, e.g. `/etc/systemd/system/__APP__.service.d/override.conf`:

```ini
[Service]
Environment="FLOWPLAN_UPDATE_CHECK=off"
```

then `systemctl daemon-reload && systemctl restart __APP__`. All variables: https://docs.flowplan.org/en/environment-variables

### Backups

YunoHost's backup includes the data folder with a consistent copy of the database taken while Flowplan keeps running. Flowplan's own backups (Administration → Backups) can be used in addition.
