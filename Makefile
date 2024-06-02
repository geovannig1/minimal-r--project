## Variables
R_OPTS=--no-save --no-restore



## Default goal; "make report" == "make"
.DEFAULT_GOAL := report



## Basic rule to generate the analysis report
.PHONY : report
report : output output/tests.txt output/report.html



## Create output directory
output :
	@echo --- Creating output directory ---
	mkdir -p $@



## Run tests
output/tests.txt : R/tests.R
	@echo --- Running all unit tests ---
	Rscript $(R_OPTS) "$<" >> "$@"
	@echo ; cat $@



## Generate analysis report
output/report.html : md/report.Rmd
	@echo --- Generating project report ---
	Rscript $(R_OPTS) \
		-e "library(rmarkdown)" \
		-e "render('$<',output_file='$@',output_dir='$(@D)')" 



## Test; can "make test"
.PHONY : test
test : output output/tests.txt



## Clean; "make clean" deletes all output
.PHONY : clean
clean : 
	@echo --- Removing generated files ---
	rm -r output 2> /dev/null; true

