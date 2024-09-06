FROM archlinux:base

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm --needed --overwrite '*' \
      openssh sudo \
      git fakeroot binutils gcc awk binutils xz \
      libarchive bzip2 coreutils file findutils \
      gettext grep gzip sed ncurses util-linux \
      pacman-contrib debugedit patch neofetch

COPY . .
ENV BUILDDIR=/tmp/build
ENV PKGDEST=/tmp/pkgdestdest
ENV SRCDEST=/tmp/srcdest
RUN patch /bin/makepkg <makepkg.patch

ENTRYPOINT ["/entrypoint.sh"]
