all: index.html index.pdf index.docx index.txt

html: index.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o index.html index.md
	pandoc --standalone -c style.css --from markdown --to html -o one_page.html one_page.md

pdf: index.html
	pandoc index.md -o index.pdf --pdf-engine=wkhtmltopdf --css style.css -V papersize=letter \
	  -V margin-top=15mm -V margin-bottom=15mm -V margin-left=15mm -V margin-right=15mm
	pandoc one_page.md -o one_page.pdf --pdf-engine=wkhtmltopdf --css style.css -V papersize=letter

docx: index.md
	pandoc --from markdown --to docx -o index.docx index.md

txt: index.md
	pandoc --standalone --smart --from markdown --to plain -o index.txt index.md

clean:
	rm -f *.html *.pdf *.docx *.txt
