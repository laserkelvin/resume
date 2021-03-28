all: html pdf

html: resume.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o resume.html resume.md
	pandoc --standalone -c style.css --from markdown --to html -o one_page.html one_page.md

pdf: resume.html
	pandoc resume.md -o resume.pdf --pdf-engine=wkhtmltopdf --css style.css -V papersize=letter \
	  -V margin-top=15mm -V margin-bottom=15mm -V margin-left=15mm -V margin-right=15mm
	pandoc one_page.md -o one_page.pdf --pdf-engine=wkhtmltopdf --css style.css -V papersize=letter

docx: resume.md
	pandoc --from markdown --to docx -o resume.docx resume.md

txt: resume.md
	pandoc --standalone --smart --from markdown --to plain -o resume.txt resume.md

clean:
	rm -f *.html *.pdf *.docx *.txt
