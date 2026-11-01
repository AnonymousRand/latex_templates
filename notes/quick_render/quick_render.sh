#!/usr/bin/env bash

set -euo pipefail
shopt -s nullglob # avoid errors when no matches for globs

# SYNC: figure paths
density=240
file_to_render_no_ext=main
rendered_figure_pdfs_path=figure_pdfs/
image_output_path=image_output/

if [[ ! -d "$rendered_figure_pdfs_path" ]]; then
    mkdir -p "$rendered_figure_pdfs_path"
fi

if [[ ! -d "$image_output_path" ]]; then
    mkdir -p "$image_output_path"
fi

# parse args
if [[ $# -gt 0 ]]; then
    density="$1"
fi

rm "$rendered_figure_pdfs_path"/*.pdf -f # sometimes latex won't update otherwise
pdflatex -shell-escape "$file_to_render_no_ext.tex"
rendered_figure_pdfs=("$rendered_figure_pdfs_path"/*.pdf)
for rendered_figure_pdf in "${rendered_figure_pdfs[@]}"; do
    file_basename="$(basename "$rendered_figure_pdf" .pdf)"
    magick -density "$density" \
        "$rendered_figure_pdf" "$image_output_path/$file_basename.png"
    # for imagemagick version <7
    #mogrify -format png -density "$density" -path "$image_output_path" "$rendered_figure_pdf"
done
