#!/bin/sh

PYTHON_MODE=$1

echo "Adding project initiated..."

# Add the static header (reset README.md)
cat static/header.md > README.md

# Run the module code (either Haskell or Python)
if [ "$PYTHON_MODE" = "--no-cabal" ]; then
  echo "Python code? Dare you! Unacceptable. Anyway..." # =) (joke)
  ./py/add_proj.py && ./py/sort_projs.py
else cabal run; fi

# Add the static footer
cat ./static/footer.md >> README.md

echo "The project has been successfully added. You may now stash your changes."
