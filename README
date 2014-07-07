### Introduction
This is a LaTeX's class-file (`nctam_proceeding.cls`) and other corresponding files for the [Proceedings of the National Congress for Theoretical and Applied Mechanics](http://news-sv.aij.or.jp/nctam/63/). The class-file is designed to meet the [basic requirement](http://news-sv.aij.or.jp/nctam/63/NCTAM-Format.pdf) of the conference.
To use the class-file include 
```TeX
\documentclass[jp]{nctam_proceeding}
```
in your TeX-file. For the reference style:
```TeX
\bibliographystyle{nctam_proceeding}
```
The option `jp` is for those who plan to write the proceeding in Japanese: it replaces "References"  will be replaced with "参考文献" in the bibliography section. Remove it if you plan to write the manuscript in English.

### Sample
Use the sample TeX-file (`sample.tex`) to see how the class-file is used.
Compile the file with `platex` + `dvipdfmx`:
```ShellSession
$ platex --kanji=utf8 sample.tex
$ dvipdfmx sample.dvi
```
A simple `latexmkrc` is also provided for those who uses `latexmk`
```ShellSession
$ latexmk sample.tex
```
