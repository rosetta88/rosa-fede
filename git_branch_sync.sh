#!/bin/bash

# Controllo argomenti
if [ "$#" -lt 2 ]; then
  echo "Errore: Mancano argomenti."
  echo "Utilizzo: ./git_branch_sync.sh <nome_branch> \"messaggio commit\""
  exit 1
fi

BRANCH_NAME=$1
COMMIT_MESSAGE=$2

# Verifica se il branch esiste già
if git show-ref --verify --quiet "refs/heads/$BRANCH_NAME"; then
  echo "--- Switch al branch esistente: $BRANCH_NAME ---"
  git checkout "$BRANCH_NAME"
else
  echo "--- Creazione e switch al nuovo branch: $BRANCH_NAME ---"
  git checkout -b "$BRANCH_NAME"
fi

echo "--- Aggiunta file ---"
git add .

echo "--- Committing ---"
git commit -m "$COMMIT_MESSAGE"

echo "--- Pushing to branch $BRANCH_NAME ---"
git push origin "$BRANCH_NAME"

if [ $? -eq 0 ]; then
  echo "--- Successo! Branch $BRANCH_NAME aggiornato su GitHub ---"
else
  echo "--- Errore durante il push ---"
  exit 1
fi
