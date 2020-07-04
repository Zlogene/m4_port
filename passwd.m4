PAM_MODULE_ADD([auth],[sufficient],[pam_rootok.so])
PAM_MODULE_ADD([auth],[include],[system-auth])
PAM_MODULE_ADD([account],[include],[system-auth])
PAM_MODULE_ADD([passwd],[include],[system-auth])
PAM_MODULE_ADD([-passwd],[optional],[pam_gnome_keyring.so] UNIX_AUTHOK)

