#!/system/bin/sh
# chenfeng battery optimization: the optional "unlimited Google Photos" add-on apps
# (GmsCore + ReVanced GPhotos) do aggressive background sync that keeps the modem awake
# and drains standby battery. Drop them into the RESTRICTED standby bucket and deny
# background work on every boot. No-op if they aren't installed.
for p in app.revanced.android.gms app.morphe.android.apps.photos; do
    if pm path "$p" >/dev/null 2>&1; then
        cmd appops set "$p" RUN_ANY_IN_BACKGROUND ignore 2>/dev/null
        am set-standby-bucket "$p" restricted 2>/dev/null
        log -t chenfeng-battopt "restricted $p"
    fi
done
