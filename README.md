# Notes on Discrete Mathematics at WCSU
## To Do/Status:
Finished basic compilation of notes including logic and sets references in the appendix.  Still need to:
- Need to add all the alt text material for the last chapter or so
- circuits material (see Circuit Tests project on Overleaf)
- probability reference ?
- writing math recommendations (not the full packet?)
- Add practice exams at the end of chapters
- Extend Preface
- Look for additional places to add index entries
- Find way to add "infinite loop" to index
- Where "appropriate" add ```\pageref{}``` for image refernces that may need lots of page flipping
- Look for places that should have ```\cleardoublepage``` instead of ```\clearpage```
- Explore web publication with https://tug.org/TUGboat/tb40-1/tb124hoftich-make4ht.pdf
- Add questions on identifying a sequence formula given part of the sequence
  - Repeat n n times: $a_n = floor(\sqrt{2n} + 1/2)$
  - geometric example
  - arithmetic example
  - basic-ish formula like $(-1)^n/(n(n+1))$
  - $a_n = 3^n - 2$ or $a_n=a_{n-1}+6\cdot 3^{n-2}$
- Add note about the On-Line Encyclopedia of Integer Sequences (OEIS) (https://oeis.org/) as well as citation to the Encyclopedia
- Add example of relation where $\theta \sim \phi$ if and only if $\theta-\phi\in\mathbb{Q}$
- Redo graphics for composing functions so that the names of the functions are not in the domains/codomains (around page 74)

## TikZ Image Creation:
- Put every TikZ image in its own file
- Use Externalize to have TikZ create PDF's of images (https://www.overleaf.com/learn/latex/Questions/I_have_a_lot_of_tikz%2C_matlab2tikz_or_pgfplots_figures%2C_so_I%27m_getting_a_compilation_timeout._Can_I_externalise_my_figures%3F)
- Use the following when inputting the TikZ, this ensures that the pdf file generated has the same name as the *.tex file the TikZ code is in
```
    % input command code based on 
    % https://tex.stackexchange.com/questions/482557/how-to-externalize-tikz-pictures
    % modified so that the tikz files are in the tikz folder where the exertanlized
    % pictures are kept.
    \newcommand{\inputtikz}[1]{%
      \tikzsetnextfilename{#1}%
      \input{tikz/#1.tex}%
    }
```
- Use imagemagick with the command ```for file in *.pdf; do magick -density 300 "$file" "${file%.pdf}.png"; done``` in terminal window to convert pdf images to png
- Copy png to Overleaf and input like so ```\includegraphics[scale=0.24,alt={...}]{images/created/*.png}```
- Note that as part of the image conversion process the png is larger, but when potentially converting to HTML for posting online png is preferable to pdf and for accessability so Acrobate recognizes it is an image.

## Other Stuff ...
