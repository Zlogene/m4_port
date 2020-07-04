PAM_MODULE_ADD([auth], [required], [pam_deny.so])
PAM_MODULE_ADD([account], [required], [pam_deny.so])
PAM_MODULE_ADD([session], [required], [pam_deny.so])
PAM_MODULE_ADD([password], [required], [pam_deny.so])
