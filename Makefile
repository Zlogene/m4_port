# The pam.d file to create
PAMD=login other passwd

# command for git (the DVCS); set this to "true" to ignore GIT support
# (i.e.: in the ebuild)
GIT ?= git

# Set some sane defaults that we can use to test if the generation
# works as intended.
PAMFLAGS ?= -DDEBUG

all: $(PAMD)

install: $(PAMD)
	install -d "$(DESTDIR)/etc/pam.d"
	install -m0644 $(PAMD) "$(DESTDIR)/etc/pam.d"

PACKAGE=pambase
ifeq "$(VERSION)" ""
VERSION = $(shell date +"%Y%m%d")
endif

dist: $(PACKAGE)-$(VERSION).tar.bz2

$(PACKAGE)-$(VERSION).tar.bz2: $(shell $(GIT) ls-files)
	$(GIT) tag $(PACKAGE)-$(VERSION)
	$(GIT) archive --format=tar --prefix=$(PACKAGE)-$(VERSION)/ HEAD | bzip2 > $@

$(PAMD): %: %.m4 main.m4 linux-pam.m4 login.m4 other.m4 passwd.m4
	m4 -DPAM_SERVICE=$* $(PAMFLAGS) main.m4 > $@

clean:
	rm -f $(PAMD) *~
