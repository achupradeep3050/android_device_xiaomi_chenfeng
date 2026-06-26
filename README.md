# Device Tree — Xiaomi 14 Civi (`chenfeng`) — LineageOS 23.2 / Android 16

Maintained by **@achupradeep3050**. This tree builds **LineageOS 23.2 (Android 16)** for the
Xiaomi 14 Civi (`chenfeng`, SM8635 / Snapdragon 8s Gen 3).

> **Credits / lineage:** the device bring-up (proprietary blob lists, board configs, base sepolicy)
> originates from the community **[Little-Chenfeng-ID](https://github.com/Little-Chenfeng-ID/android_device_xiaomi_chenfeng)**
> tree — full credit to the original authors for the hard bring-up work. This repository is an
> **enhanced fork** that adds the features below on top of that base. If you reuse it, keep this credit.

---

## ✨ What this tree adds (over the base)

| Feature | Notes |
|---|---|
| **Double-tap-to-wake** | Armed via the stock `xiaomi-touch` driver's register-then-set ioctl (mode 14) from the LineageOS sensors HAL — first working DT2W on chenfeng. *(needs the companion `hardware/xiaomi` patch.)* |
| **Screen-off / in-display fingerprint** | Same mechanism, FOD-enable mode 10. |
| **Gaming 60 / 90 / 120 fps** | Removes AOSP's default 60 fps game frame-rate cap (BGMI/PUBG/CoD honor your in-game tier). |
| **Force 4x MSAA** | Enabled by default, persistent, independent of Developer Options. |
| **Play Integrity BASIC** | No-root framework PropImitationHooks (dormant on the GApps-free build). |
| **Developer-options hidden from apps** | Banking/DRM apps see dev-options/ADB as off; your Settings + adb still work. *(companion `frameworks/base` patch.)* |

**Companion changes (separate repos/patches) for the full feature set:**
- `hardware/xiaomi` — sensors HAL ioctl for DT2W/FOD.
- `frameworks/base` — dev-options hiding + PropImitationHooks (BASIC integrity, GPhotos spoof).

## 🔧 Build
```
. build/envsetup.sh
lunch lineage_chenfeng-bp4a-userdebug
m bacon          # or: WITH_GAPPS=true m bacon
```

## 📥 Flashing, GApps, unlimited Google Photos, GCam
See the release notes (`CHANGELOG-and-INSTALL.md`). Highlights:
- GApps: sideload MindTheGapps 16 after the ROM.
- **Unlimited Google Photos:** GmsCore + ReVanced GPhotos (A16-proof, no root) — tested.
- **Camera:** GCam BSG MGC 9.7 (Camera2 verified); import a 14-Civi config for the Leica look.

## ⚠️ Honest notes
- **DEVICE/STRONG Play Integrity is not achievable** on an unlocked bootloader without a valid
  (leaked) keybox — RKP is refused for unlocked devices. This tree ships **BASIC** only.
- Built/tested `userdebug`. SELinux **enforcing**.

## License
Same license as the upstream base tree; attribution preserved per above.
