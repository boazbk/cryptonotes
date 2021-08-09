#!/bin/bash
# deploy web page
echo "Deploying to web"
echo "Cleaning deploy directory"
rm -rf deploy/public/*
#rm -rf deploy/figure/*
echo  "Copying files to deploy"
cp -Rf htmlbase/* deploy/
cp -Rf html/* deploy/public
echo  "Copying images (png and jpg only)"
for filename in figure/*.png; do
   if [[ (! -f deploy/$filename ) || ($filename -nt deploy/$filename) ]]; then
  echo "deploy/$filename doesnt exist or older than /$filename"
  cp -f $filename deploy/$filename
  pngquant 256 --verbose --skip-if-larger --force --ext .png deploy/$filename
   else
   echo "No need to copy $filename"
    fi
done
echo "Removing powerpoint"
rm -f deploy/figure/*.pptx
cp -f figure/*.jpg deploy/figure

echo "Compressing full book pdf"
cd "latex-book"
ghostscript -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dPrinted=false -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf lnotes_book.pdf
mv output.pdf lnotes_book.pdf
cd ..

cp -Rf latex-book/*.pdf binaries/
