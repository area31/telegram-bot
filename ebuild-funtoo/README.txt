1- Create local overlay:

http://www.funtoo.org/Local_Overlay



2- Add portdir_overlay on /etc/make.conf:

PORTDIR_OVERLAY="/var/overlay/local"



3- Add this ebuild on /var/overlay/local/net-im/telegram-cli/



4- Run eix-update



5- Emerge and be happy



More infos:

[I] net-im/telegram-cli [1]
     Available versions:  (~)9999{tbz2} {json lua python}
     Installed versions:  9999{tbz2}(03:48:30 AM 08/31/2015)(json lua python)
     Homepage:            https://github.com/vysheng/tg
     Description:         Command line interface client for Telegram

[1] "coffnix-tools" /var/overlay/local
