# H77N-WIFI-Clover-Hotpatch-Patches
H77N-WIFI Patches

H77N-WIFI Patches for Clover hotpatch. I have added SSDT-Hack for Users that uses Intel HD 4000. SSDT-GFX0 for users that uses Cards that requires GFX0 edits via ACPI.


New sound solution for ALC892. Added SSDT-Codec to SSDT-Hack & SSDT-GFX0 no need to use realtekALC or a patched AppleHDA Injector all done via ACPI.

SSDT-Hack also has support for HDMI Audio with Intel HD 4000, SSDT-GFX0 also has edits for HDMI Audio with Dedicated Graphics.

SSDT-IMEI has been added to SSDT-Hack but not been added to SSDT-GFX0.

Added fix for No Audio after Sleep fixed by CodecCommander and pinconfigs which are injected via ACPI. But will need to download CodecCommander from Rehabmans Fork. 

iGPU is now controlled via SSDT-IGPU thats been added to SSDT-Hack. No need to use Clovers Graphics Injection. 

Added correct Capri Frame Buffer Patch to KextToPatch in Config. Only Applies to users that use IGPU. Pair SSDT-Hack with post_install_HD4000.plist. Only added patched for HDMI Port not DVI Port. Users will need to contact me.

Added support for Dedicated Graphics. Have not tested Patches with Dedicated Graphics. For users with Dedicated Graphics Pair SSDT-GFX0 with post_install_nvidia_graphics.plist or post_install_nvidia_graphics_nvidiaweb.plist.
Users with Dedicated Graphics will need to contact me if any problems.

EC Controller has been added to SSDT-Hack & SSDT-GFX0 needed to fix USB Power in macOS 10.12+.

AAPL Power Properties are still injected and have added both AAPL Injection for EH01, EH02 & XHC Controllers. 

LPCB Device has been spoofed with a supported Series 7 Device ID has been added to SSDT-Hack & SSDT-GFX0. 

SAT0 has been renamed to SATA & has edits in SSDT-Hack and SSDT-GFX0.

Realtek Ethernet Ports has patches in SSDT-Hack & SSDT-GFX0.

Sleep/Wake works with Audio After Sleep.

Native Powermanagement works.

Onboard iGPU works and iGPU Powermanagement. 

