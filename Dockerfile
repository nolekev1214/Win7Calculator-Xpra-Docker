FROM fedora:latest
LABEL maintainer="nolekev1214"

RUN dnf update -y && dnf install -y wget openssl

RUN wget -O /etc/yum.repos.d/xpra.repo https://raw.githubusercontent.com/Xpra-org/xpra/master/packaging/repos/Fedora/xpra.repo
RUN dnf update -y && dnf install -y xpra xpra-html5 xterm

RUN dnf install -y flatpak
RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
RUN flatpak install -y flathub com.usebottles.bottles

COPY calc.exe /calc.exe

CMD ["xpra", "start", "--start=xterm", "--bind-tcp=0.0.0.0:10000,auth=env", "--daemon=no"]