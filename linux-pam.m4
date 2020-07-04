warning([Assuming Linux-PAM >= 1.4.0])

define([HAVE_LIMITS])
define([HAVE_ENV])
define([HAVE_ACCESS])
define([HAVE_SHELLS])
define([HAVE_LOGINUID])
define([HAVE_SECURETTY])

define([SUPPORT_UNIX_SESSION])
define([SUPPORT_NOLOGIN_ACCOUNT])
define([SUPPORT_NOLOGIN_AUTH])

ifdef([MINIMAL],, [
  define([HAVE_MOTD])
  define([HAVE_MAIL])
  define([HAVE_LASTLOG])
])

dnl following will require Linux-PAM 1.4.0 or later
define([FAILLOCK_MODULE], [pam_faillock.so])
define([UNIX_EXTENDED_ENCRYPTION], [sha512 shadow])

define([LIKEAUTH], [likeauth])
define([DEBUG_NOLOGIN], [])
define([AUTHTOK], [use_authok])
define([UNIX_AUTHOK], [use_authok])
