
#!/bin/bash

WIDTH=${1}
MAX=160
if [ "$WIDTH" -ge 160 ]; then
    echo -n "#[fg=colour236,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour247,bg=colour236] $(date +%y.%m.%d)  $(date +%H:%M) #[fg=colour252,bg=colour236,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour252] #h "
elif [ $WIDTH -ge 120 ]; then
    echo -n "#[fg=colour236,bg=colour234,nobold,nounderscore,noitalics]#[fg=colour247,bg=colour236] $(date +%H:%M) #[fg=colour252,bg=colour236,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour252] #h "
else
    echo -n "#[fg=colour236,bg=colour234,nobold,nounderscore,noitalics]#[fg=colour247,bg=colour236] $(date +%H:%M) "
fi
