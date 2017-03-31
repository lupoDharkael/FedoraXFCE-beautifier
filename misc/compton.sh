sudo dnf copr enable mkrawiec/i3desktop
sudo dnf install compton
#Ajustes del gestor de ventanas/Compositor/Desactivar primera casilla
xfconf-query -c xfwm4 -p /general/use_compositing -s false
Sesion e inicio/Autoarranque de Aplicaciones/compton --vsync opengl
#https://www.reddit.com/r/unixporn/comments/3crspe/xfce4_sorry_for_xfce4numix_post_9435_but_i_like/
#http://duncanlock.net/blog/2013/06/07/how-to-switch-to-compton-for-beautiful-tear-free-compositing-in-xfce/
