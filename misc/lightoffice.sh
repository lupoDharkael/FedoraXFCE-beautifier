 
# NOT COMPLETED!

echo "" >> $HOME/.bashrc &&
echo 'alias libreoffice="GTK_THEME=Adwaita libreoffice"' >> $HOME/.bashrc

change the Exec=... of the following files to:

FILE                            COMMAND
----------------------------------------------------------------------
libreoffice-base.desktop        Exec=env GTK_THEME=Adwaita libreoffice
libreoffice-calc.desktop        Exec=env GTK_THEME=Adwaita libreoffice
libreoffice-draw.desktop        Exec=env GTK_THEME=Adwaita libreoffice
libreoffice-impress.desktop     Exec=env GTK_THEME=Adwaita libreoffice
libreoffice-math.desktop        Exec=env GTK_THEME=Adwaita libreoffice
libreoffice-startcenter.desktop Exec=env GTK_THEME=Adwaita libreoffice
libreoffice-writer.desktop      Exec=env GTK_THEME=Adwaita libreoffice
