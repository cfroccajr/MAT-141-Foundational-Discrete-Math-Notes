for f in tikz/*.tex; do
  BASENAME=$(basename "$f" .tex)
  echo "$BASENAME"
  lualatex -interaction=nonstopmode --shell-escape \
    --output-directory=generated_images \
    --jobname="$BASENAME" \
    "\def\TargetFile{$f}\input{tikz_shell.tex}"
  magick -density 300 generated_images/"${BASENAME}.pdf" generated_images/"${BASENAME}.png"
  rm -f generated_images/*.{aux,log,idx,xml,bcf,out,pdf}
done
