for f in tikz/*.tex; do
  BASENAME=$(basename "$f" .tex)
  echo "$BASENAME"
  lualatex -interaction=nonstopmode --shell-escape \
    --output-directory=images/created \
    --jobname="$BASENAME" \
    "\def\TargetFile{$f}\input{tikz_shell.tex}"
  magick -density 300 images/created/"${BASENAME}.pdf" images/created/"${BASENAME}.png"
  rm -f images/created/*.{aux,log,idx,xml,bcf,out,pdf}
done
