#!/system/bin/sh

# Wait for post processes to finish
while [ "$(getprop sys.boot_completed | tr -d '\r')" != "1" ]; do
  sleep 7
done

# Enable MagiskHide after Zygisk
if ! magiskhide status >/dev/null 2>&1; then
  magiskhide enable
  sleep 7
  reboot
fi
