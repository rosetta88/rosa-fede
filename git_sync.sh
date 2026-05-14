#!/bin/bash

# Controlla se è stato fornito un messaggio di commit
if [ -z "$1" ]; then
  echo "Errore: Inserisci un messaggio di commit."
  echo "Utilizzo: ./git_sync.sh \"il tuo messaggio\""
  exit 1
fi

COMMIT_MESSAGE=$1

echo "--- Aggiunta file ---"
git add .

echo "--- Committing ---"
git commit -m "$COMMIT_MESSAGE"

echo "--- Pushing to GitHub ---"
git push origin main

if [ $? -eq 0 ]; then
  echo "--- Successo! ---"
else
  echo "--- Errore durante il push ---"
  exit 1
fi
