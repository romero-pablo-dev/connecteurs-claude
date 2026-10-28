#!/usr/bin/env bash
set -e
# Publie la page sur GitHub Pages. Prerequis : gh auth login --web (une seule fois).
REPO=${1:-connecteurs-claude}
gh repo create "$REPO" --public --source=. --push --description "20 connecteurs Claude : la ressource envoyee a ceux qui commentent MCP ou connecteur"
USER=$(gh api user --jq .login)
gh api -X POST "repos/$USER/$REPO/pages" -f "source[branch]=main" -f "source[path]=/" || gh api -X PUT "repos/$USER/$REPO/pages" -f "source[branch]=main" -f "source[path]=/"
echo "En ligne dans une minute : https://$USER.github.io/$REPO/"
