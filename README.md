<!--
N.B.: This README is replaced by YunoHost's README generator once the app is in the catalog.
-->

# Flowplan for YunoHost

[Flowplan](https://flowplan.org) is an open-source alternative to Notion and AppFlowy: documents, databases, whiteboards and a daily journal in one page tree, edited together and live.

This package installs it on [YunoHost](https://yunohost.org) – with sign-in through YunoHost accounts (LDAP) and automatic sign-in for whoever is logged in on the YunoHost portal (SSO).

**Shipped version:** 0.9.8~ynh1

![Flowplan](./doc/screenshots/flowplan.jpg)

## Install

```bash
sudo yunohost app install https://github.com/yannicschuller/flowplan_ynh
```

Flowplan needs a domain or subdomain of its own. See [doc/PRE_INSTALL.md](doc/PRE_INSTALL.md) and [doc/ADMIN.md](doc/ADMIN.md).

## How it works

- The package downloads the release archive for the server's architecture (`amd64` or `arm64`) from the [Flowplan releases](https://github.com/yannicschuller/flowplan/releases) – the same build as the Docker image – and runs it with Node.js 26 as a systemd service behind nginx.
- Data (SQLite database, uploads, keys) lives in `/home/yunohost.app/flowplan`.
- Sign-in: YunoHost's LDAP for users with the app's permission; portal users are signed in from SSOwat's `Ynh-User` headers; members of the YunoHost group `admins` are Flowplan admins.
- E-mail goes through YunoHost's Postfix with the app's own mail account.

## Links

- Documentation: https://docs.flowplan.org
- Upstream: https://github.com/yannicschuller/flowplan
- Report a bug in the package: https://github.com/yannicschuller/flowplan_ynh/issues
