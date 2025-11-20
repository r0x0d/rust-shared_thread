NAME := shared_thread

all: copr-build

.PHONY: create-copr-repo
create-copr-repo:
	copr create $(NAME) --chroot fedora-rawhide-x86_64
	touch $@

.PHONY: rust2rpm
rust2rpm:
	rust2rpm $(NAME)
	touch $@

.PHONY: sources
sources:
	spectool -g rust-$(NAME).spec
	touch $@

.PHONY: srpm
srpm:
	fedpkg srpm

.PHONY: copr-build
copr-build:
	copr build $(NAME) rust-$(NAME)*.src.rpm
