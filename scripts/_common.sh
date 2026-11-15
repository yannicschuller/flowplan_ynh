#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

# The domain Postfix's certificate is issued for (STARTTLS to 127.0.0.1 checks it).
main_domain=$(yunohost domain main-domain --output-as plain 2>/dev/null || echo "$domain")

# Writes the environment file and makes it readable for the app only.
flowplan_write_env() {
    ynh_config_add --template=".env" --destination="$install_dir/.env"
    chown "$app:$app" "$install_dir/.env"
    chmod 400 "$install_dir/.env"
}

# Waits until Flowplan answers its health check (first start migrates the database).
flowplan_wait_until_ready() {
    local i
    for i in $(seq 1 90); do
        if curl --silent --fail --max-time 5 "http://127.0.0.1:$port/api/health" >/dev/null; then
            return 0
        fi
        sleep 2
    done
    ynh_print_warn "Flowplan did not answer within 3 minutes; see /var/log/$app/$app.log"
}
