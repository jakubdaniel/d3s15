PANDA=../../projects/panda
PRESENTATION=../../slides/d3s15
JAVA=/opt/oracle-jdk-bin-1.7.0.76

CFLAGS=-I$(JAVA)/include -I$(JAVA)/include/linux -fPIC
LDFLAGS=-shared -Wl,-soname,libarraymin.so.1 -o libarraymin.so.1.0
CLASSPATH=.:$(PANDA)/build/classes

all: slides.pdf

slides.pdf: %.pdf: %.latex %.mp beamerthemeD3S.sty algorithm.tex ArrayMinEnv.java
	@mpost $*.mp
	@pdflatex $*.latex
	@pdflatex $*.latex

present: all
	@dspdfviewer -a no -f slides.pdf

check: ArrayMin.jpf ArrayMinEnv.class
	@cd $(PANDA) && bin/run.sh +classpath=$(PRESENTATION) +sourcepath=$(PRESENTATION) $(PRESENTATION)/$<




### The following allows to run the example alone and in Panda

ArrayMin: ArrayMinEnv.class arraymin
	@java -ea -cp $(CLASSPATH) ArrayMinEnv

ArrayMinEnv.class: %.class: %.java gov_nasa_jpf_abstraction_Verifier.h gov_nasa_jpf_abstraction_Verifier.c
	@javac -cp $(CLASSPATH) ArrayMinEnv.java

gov_nasa_jpf_abstraction_Verifier.h:
	@javah -stubs -cp $(CLASSPATH) gov.nasa.jpf.abstraction.Verifier

arraymin: gov_nasa_jpf_abstraction_Verifier.o
	@gcc $(LDFLAGS) $<

gov_nasa_jpf_abstraction_Verifier.o: %.o: %.c %.h
	@gcc $(CFLAGS) -c $<
