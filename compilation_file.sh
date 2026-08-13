#!/bin/bash
set -e

MAIN="main"
OUT="out"

# Ensure output directory exists
mkdir -p "$OUT"

echo "=== Pass 1: Initial LuaLaTeX run ==="
lualatex -interaction=nonstopmode --shell-escape -output-directory="$OUT" "$MAIN.tex" > /dev/null

echo "=== Pass 2: Running Biber (Bibliography) ==="
# Biber requires the output directory flag to locate $MAIN.bcf
biber --input-directory="$OUT" --output-directory="$OUT" "$MAIN" > /dev/null || echo "Biber notice: Check if citations exist."

echo "=== Pass 3: Running MakeIndex (Indices) ==="
# MakeIndex needs explicit pathing when working with subfolders
makeindex -o "$OUT/$MAIN.ind" "$OUT/$MAIN.idx" > /dev/null 2>&1 || echo "MakeIndex notice: Check if index entries exist."

echo "=== Pass 4: Resolving cross-references (LuaLaTeX) ==="
lualatex -interaction=nonstopmode --shell-escape -output-directory="$OUT" "$MAIN.tex" > /dev/null

echo "=== Pass 5: Finalizing layout & page numbers (LuaLaTeX) ==="
lualatex -interaction=nonstopmode --shell-escape -output-directory="$OUT" "$MAIN.tex" > /dev/null

echo "=== Pass 6: Cleaning up auxiliary files ==="
# Delete intermediate TeX files inside the out folder, keeping only the final PDF
rm -f "$OUT/$MAIN".{aux,bcf,bbl,blg,idx,ilg,ind,log,out,run.xml,toc,lot,lof,nav,snm}

echo "Done! Output compiled to $OUT/$MAIN.pdf"

# all from Gemini