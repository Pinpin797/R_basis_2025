all: public/index.html \
    public/img/ \
	public/session_1.html \
	public/session_2.html \
	public/session_3.html \
	public/session_4.html \
	public/session_5.html \
	public/session_6.html \
	public/session_7.html \
	public/session_8.html

public/:
	mkdir -p public
	mkdir -p public/www
	mkdir -p public/img

public/img/:
	cp -r img/ public/img

public/www/github-pandoc.css: www/github-pandoc.css
	cp www/github-pandoc.css public/www/github-pandoc.css

public/www/style_Rmd.css: www/style_Rmd.css
	cp www/style_Rmd.css public/www/style_Rmd.css

public/www/*.ttf: www/Raleway-Regular.ttf www/YanoneKaffeesatz-Bold.ttf
	cp www/*ttf public/www/

public/index.html: public/ index.md public/www/github-pandoc.css
	pandoc -s -c www/github-pandoc.css index.md -o public/index.html

public/session_1.html: public/ session_1/session_1.Rmd public/www/style_Rmd.css
	Rscript -e 'rmarkdown::render("session_1/session_1.Rmd", output_dir = "public/")'

public/session_2.html: public/ session_2/session_2.Rmd public/www/style_Rmd.css
	Rscript -e 'rmarkdown::render("session_2/session_2.Rmd", output_dir = "public/")'

public/session_3.html: public/ session_3/session_3.Rmd public/www/style_Rmd.css session_3/gapminder.xlsx
	mkdir -p public/session_3/
	cp session_3/gapminder.xlsx public/session_3/gapminder.xlsx
	Rscript -e 'rmarkdown::render("session_3/session_3.Rmd", output_dir = "public/")'

public/session_4.html: public/ session_4/session_4.Rmd public/www/style_Rmd.css
	mkdir -p public/session_4/
	cp session_4/*.csv public/session_4/
	Rscript -e 'rmarkdown::render("session_4/session_4.Rmd", output_dir = "public/")'

public/session_5.html: public/ session_5/session_5.Rmd public/www/style_Rmd.css
	Rscript -e 'rmarkdown::render("session_5/session_5.Rmd", output_dir = "public/")'

public/session_6.html: public/ session_6/session_6.Rmd public/www/style_Rmd.css
	Rscript -e 'rmarkdown::render("session_6/session_6.Rmd", output_dir = "public/")'

public/session_7.html: public/ session_7/session_7.Rmd public/www/style_Rmd.css
	Rscript -e 'rmarkdown::render("session_7/session_7.Rmd", output_dir = "public/")'

public/session_8.html: public/ session_8/session_8.Rmd public/www/style_Rmd.css
	Rscript -e 'rmarkdown::render("session_8/session_8.Rmd", output_dir = "public/")'

## Test docker in local

test : local/index.html \
  local/session_1.html
	

local/: 
	mkdir -p local
	mkdir -p local/www
	mkdir -p local/img

local/www/github-pandoc.css: local/ www/github-pandoc.css
	cp www/github-pandoc.css local/www/github-pandoc.css

local/www/style_Rmd.css: local/ www/style_Rmd.css
	cp www/style_Rmd.css local/www/style_Rmd.css

local/www/*.ttf: local/ www/Raleway-Regular.ttf www/YanoneKaffeesatz-Bold.ttf
	cp www/*ttf local/www/

local/session_1.html: local/ session_1/session_1.Rmd local/www/style_Rmd.css
	docker run --rm -ti -v ${PWD}:/work -w /work carinerey/r_for_beginners \
Rscript -e 'rmarkdown::render("session_1/session_1.Rmd", output_dir = "local/")'

local/index.html: local/ index.md local/www/github-pandoc.css
	docker run --rm -ti -v ${PWD}:/work -w /work carinerey/r_for_beginners \
pandoc -s -c www/github-pandoc.css index.md -o local/index.html

clean:
	sudo rm -r local public

.PHONY: clean test