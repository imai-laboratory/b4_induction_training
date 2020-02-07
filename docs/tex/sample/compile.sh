# tex to dvi
platex main.tex

# attach bib
pbibtex main

# tex to dvi
platex main.tex
platex main.tex
platex main.tex

# dvi to pdf
dvipdfmx main.dvi

# open Preview app
open -a Preview main.pdf
