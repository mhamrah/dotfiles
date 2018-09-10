#!/bin/bash

#KUBESYMBOL=$'\u2388'
KUBESYMBOL='⎈'
echo -n '#[fg=colour237,bg=colour234]'

echo -n "#[fg=colour140,bg=colour237] $KUBESYMBOL $(kubectl config view --minify --output 'jsonpath={.current-context}'):#[fg=colour145]$(kubectl config view --minify --output 'jsonpath={..namespace}')"
