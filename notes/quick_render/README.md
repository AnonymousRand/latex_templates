For quickly exporting tikz and tikz-cd diagrams individually to PNGs, such as when I need to embed them in my blog (no MathJax support, and TikZJax is CSP hell).

# To sync these files:
1. Navigate to a working directory
2. Recursively copy over the contents of the `notes/` **parent** directory
    - Having SCP access and setting up a script so you don't have to type the full command every time is recommended
    - Otherwise, sorry this isn't an FTP server; you might just have to `wget` everything individually or something
    - Parent directory is needed for custom commands etc. defined in `/notes/main/`
3. Make sure `texlive` (containing `pdflatex`) and `imagemagick` are installed
    - Might need to install extra packages for imported LaTeX libraries, such as (package names are for `apt`):
        - `texlive-latex-extra`
        - `texlive-science`
    - Comment out the line containing `rights=none pattern="PDF"` near the bottom of `/etc/ImageMagick-[version]/policy.xml` to allow PDF conversion to PNG (this was an emergency patch for an old vulnerability that they've fixed in Ghostscript >=9.24)

# To render:
1. Make sure you are in the `quick_render/` directory
2. Put LaTeX in `main.tex`
3. `./quick_render.sh`
4. Get results in `image_outputs/`
5. Optionally, comment out the font change in the premable to get default LaTeX font
