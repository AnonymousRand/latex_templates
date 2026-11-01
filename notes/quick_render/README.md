for quickly exporting tikz and tikzcd diagrams individually to pngs, like when i need to embed them in my blog (no mathjax support, and tikzjax is csp hell 3:).

# requirements

- `texlive` (containing `pdflatex`) and `imagemagick` need to be installed.
- you might need to install extra packages for imported latex libraries, such as (package names are for `apt`):
    - `texlive-latex-extra`
    - `texlive-science`
- comment out the line containing `rights=none pattern="PDF"` near the bottom of `/etc/ImageMagick-[version]/policy.xml` to allow pdf conversion to png (this was an emergency patch for an old vulnerability that they've fixed in ghostscript >=9.24).

# to render

1. make sure you are in the `quick_render/` directory.
2. put latex in `main.tex`.
3. run `./quick_render.sh`.
4. get results in `image_outputs/`.
