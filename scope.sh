#!/bin/bash
# scope.sh

# Verifica se o usuário forneceu o domínio base
if [ $# -lt 2 ]; then
    echo 'How to use: $0 "<base_domain>" "<TLD1>, <TLD2>, ... ,<TLDn>"'
    echo 'Example: $0 "example" "com, at, be, ch, us"'
    exit 1
fi

BASE="$1"
TLDS="$2"
IFS=","

# Loop para processar cada TLD individualmente
for TLD in $TLDS; do
    # Remove espaços em branco extras em torno do TLD
    TLD=$(echo "$TLD" | xargs) 

    # Substitui <tld> pelo TLD atual
    DOMAIN="$BASE.$TLD"

    # Imprime o domínio completo no arquivo scopo
    echo "$DOMAIN" >> scopo
done