all: index.html index.pdf index.docx index.txt

html: index.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o index.html index.md

pdf: index.html
	pandoc index.md -o index.pdf -t html5 --css style.css -V papersize=letter

docx: index.md
	pandoc --from markdown --to docx -o index.docx index.md

txt: index.md
	pandoc --standalone --smart --from markdown --to plain -o index.txt index.md

clean:
	rm -f *.html *.pdf *.docx *.txt
