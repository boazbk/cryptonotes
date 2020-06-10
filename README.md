# tcsbook

Repository with all resources needed to build the intro tcs book

## Dependencies

### Python packages:

* [BibtexParser](https://bibtexparser.readthedocs.io/en/master/)

* [Panflute](http://scorreia.com/software/panflute/)

* [Pylatexenc](https://pypi.org/project/pylatexenc/)

* [PyPDF2](https://pythonhosted.org/PyPDF2/)


### Fonts

* TeX Gyre Pagella
* TeX Gyre Heros
* Inconsolata LGC Markup
* FreeMono
* Asana Math


### Deploying

For deploying the binaries I use the [AWS command line](https://aws.amazon.com/cli/) to push to an S3 bucket. The web version is deployed using [netlify](https://www.netlify.com/). I use Acrobat Pro manually to compress the file, since I haven't yet found a better approach.


One way to check the dependencies is to do the following: 

* Run `make book`

* Goto `latex-book` directory

* Try to run `xelatex -shell-escape lnotes_book.tex` and see what error messages you get. The `-shell-escape` is needed for the [minted](https://ctan.org/pkg/minted?lang=en) package.



