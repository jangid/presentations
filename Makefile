# Emacs binary path — override with: make EMACS=/path/to/emacs
EMACS ?= /Applications/Emacs.app/Contents/MacOS/Emacs

# Find all presentation .org files (one per directory)
ORG_FILES := $(wildcard *//*.org)
PDF_FILES := $(ORG_FILES:.org=.pdf)

.PHONY: all clean rebuild

all: $(PDF_FILES)

# Build PDF from org file using Emacs batch + LuaLaTeX
%.pdf: %.org
	cd $(dir $<) && $(EMACS) --batch -l org -l ox-beamer \
		--eval '(progn \
			(setq org-latex-pdf-process \
				(list "lualatex -interaction nonstopmode -output-directory %o %f" \
				      "lualatex -interaction nonstopmode -output-directory %o %f")) \
			(find-file "$(notdir $<)") \
			(org-beamer-export-to-pdf))'

# Force rebuild all PDFs
rebuild:
	rm -f $(PDF_FILES)
	$(MAKE) all

clean:
	find . -name '*.tex' -o -name '*.aux' -o -name '*.log' \
		-o -name '*.nav' -o -name '*.out' -o -name '*.snm' \
		-o -name '*.toc' -o -name '*.vrb' -o -name '*.fdb_latexmk' \
		-o -name '*.fls' -o -name '*.synctex.gz' | xargs rm -f
