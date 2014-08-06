%%
%%  Manuscript class-file for NCTAM
%%  Last modified: 2014-Jul-03

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nctam_manuscript}[2014/07/01 NCTAM Manuscript Class]

%% Based on the article-class
\LoadClass[twocolumn]{article}

%% Based font-size required by NCTAM.
\DeclareOption{9pt}{
   \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{a4paper}{
   \PassOptionsToClass{\CurrentOption}{article}
}

%% Use this option if the manuscript is written in Japanese
\DeclareOption{jp}{
   \renewcommand{\refname}{参考文献}
}

%% Fallback
\DeclareOption*{
   \ClassWarning{nctam_manuscript}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{10pt}
\ExecuteOptions{a4paper}

%% Process given options
\ProcessOptions\relax

\RequirePackage{url}
\RequirePackage[compact]{titlesec}

%%
%% --Page layout
%%
\setlength{\hoffset}{-6.4mm}
\setlength{\voffset}{-1in}
\setlength{\topmargin}{30mm}
\setlength{\headheight}{0cm}
\setlength{\headsep}{0cm}
\setlength{\textheight}{243mm}
\setlength{\textwidth}{172mm}
\setlength{\parsep}{0cm}
\pagestyle{empty} % Hide page number

%% Sections
\titlespacing{\section}{0pt}{*0}{*0}
\titlespacing{\subsection}{0pt}{*0}{*0}
\titlespacing{\subsubsection}{0pt}{*0}{*0}
\titleformat*{\section}{\normalfont\normalsize\bfseries}
\titleformat*{\subsection}{\normalfont\normalsize\bfseries}
\titleformat*{\subsubsection}{\normalfont\normalsize\bfseries}
\titleformat*{\paragraph}{\normalfont\normalsize\bfseries}
\titleformat*{\subparagraph}{\normalfont\normalsize\bfseries}


%%
%% --Title
%%

%% Extra inputs
\def\titlejp#1{\gdef\@titlejp{#1}}
\def\@titlejp{\@latex@error{No \noexpand\titlejp given}\@ehc}
\def\subtitle#1{\gdef\@subtitle{#1\\}}
\def\@subtitle{}
\def\subtitlejp#1{\gdef\@subtitlejp{#1\\}}
\def\@subtitlejp{}
\def\authorjp#1{\gdef\@authorjp{#1}}
\def\@authorjp{\@latex@error{No \noexpand\authorjp given}\@ehc}
\def\fax#1{\gdef\@fax{#1}}
\def\@fax{\@latex@error{No \noexpand\fax given}\@ehc}
\def\email#1{\gdef\@email{\url{#1}}}
\def\@email{\@latex@error{No \noexpand\email given}\@ehc}
\def\abstract#1{\gdef\@abstract{#1}}
\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}

%% New maketitle
\renewcommand\maketitle{\par
   \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\ @thefnmark }}}%
      \long\def\@makefntext##1{\parindent 1em\noindent
               \hb@xt@1.8em{%
                  \hss\@textsuperscript{\normalfont\@thefnmark}}##1} %
      \if@twocolumn
         \ifnum \col@number=\@ne
            \@maketitle
         \else
            \twocolumn[\@maketitle]%
         \fi
      \else
         \newpage
         \global\@topnum\z@   % Prevents figures from going at top  of  page.
         \@maketitle
      \fi
      \@thanks
   \endgroup
   \setcounter{footnote}{0}%
   \global\let\thanks\relax
   \global\let\maketitle\relax
   \global\let\@maketitle\relax
   \global\let\@thanks\@empty
   \global\let\@author\@empty
   \global\let\@date\@empty
   \global\let\@title\@empty
   \global\let\title\relax
   \global\let\author\relax
   \global\let\date\relax
   \global\let\and\relax
   \global\let\titlejp\relax
   \global\let\@titlejp\@empty
   \global\let\subtitle\relax
   \global\let\@subtitle\@empty
   \global\let\subtitlejp\relax
   \global\let\@subtitlejp\@empty
   \global\let\authorjp\relax
   \global\let\@authorjp\@empty
   \global\let\fax\relax
   \global\let\@fax\@empty
   \global\let\email\relax
   \global\let\@email\@empty
   \global\let\abstract\relax
   \global\let\@abstract\@empty
}
\def\@maketitle{%
   \newpage
   \let \footnote \thanks
   \centering
   {\bfseries%
      {\large\@titlejp}\\%
      {\normalsize\@subtitlejp}%
      {\large\@title}\\%
      {\normalsize\@subtitle}%
   }%
   \vskip 1em%
   {\normalsize \@authorjp}\\%
   {\normalsize \@author}\\%
   {\normalsize FAX: \@fax, E-mail: \@email}\\%
   \vskip 1em%
   \begin{minipage}{\dimexpr\textwidth-5em*2\relax}
      \@abstract
   \end{minipage}
   \vskip 2.5em
}

%%
%% --Listings
%%

%% Squeeze list using Jakob's LaTeX tricks
%% http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/tweaklist.sty
\def\enumhook{}
\def\enumhooki{}
\def\enumhookii{}
\def\enumhookiii{}
\def\enumhookiv{}
\def\itemhook{}
\def\itemhooki{}
\def\itemhookii{}
\def\itemhookiii{}
\def\itemhookiv{}
\def\descripthook{}
\def\enumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}%
          \enumhook \csname enumhook\romannumeral\the\@enumdepth\endcsname}%
  \fi}
\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{##1}}%
        \itemhook \csname itemhook\romannumeral\the\@itemdepth\endcsname}%
  \fi}
\renewenvironment{description}
                 {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                          \let\makelabel\descriptionlabel\descripthook}}
                 {\endlist}

\newcommand{\squeezelistitem}{%
   \setlength{\topsep}{1pt}%
   \setlength{\partopsep}{0pt}%
   \addtolength{\itemsep}{-2pt}
   \setlength{\parsep}{0pt}%
   \setlength{\parskip}{0pt}%
   \setlength{\leftmargin}{12pt}
   \@noparlisttrue%
}

\newcommand{\squeezelistenum}{%
   \setlength{\topsep}{1pt}%
   \setlength{\partopsep}{0pt}%
   \addtolength{\itemsep}{-1pt}
   \setlength{\parsep}{0pt}%
   \setlength{\parskip}{0pt}%
   \setlength{\leftmargin}{19pt}
   \@noparlisttrue%
}

\renewcommand{\itemhook}{\squeezelistitem}
\renewcommand{\itemhooki}{\squeezelistitem}
\renewcommand{\itemhookii}{\squeezelistitem}
\renewcommand{\itemhookiii}{\squeezelistitem}
\renewcommand{\itemhookiv}{\squeezelistitem}
\renewcommand{\enumhook}{\squeezelistenum}
\renewcommand{\enumhooki}{\squeezelistenum}
\renewcommand{\enumhookii}{\squeezelistenum}
\renewcommand{\enumhookiii}{\squeezelistenum}
\renewcommand{\enumhookiv}{\squeezelistenum}

%%
%% --Figure
%%

\renewcommand{\topfraction}{0.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.75}

%% Figure caption: Figure 1: --> Fig. 1
%% Jakob's LaTeX tricks
\renewcommand{\figurename}{Fig.}
\newcommand{\captionfonts}{\normalfont}
\long\def\@makecaption#1#2{%
   \vskip\abovecaptionskip
   \sbox\@tempboxa{{\captionfonts #1\quad #2}}%
   \ifdim \wd\@tempboxa >\hsize
      {\captionfonts #1\quad #2\par}
   \else
      \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
   \fi
   \vskip\belowcaptionskip}

%%
%% --Bibliography
%%

%% Cite with superscript: 1, 3) p. 435
\def\@cite#1#2{$^{\mbox{\scriptsize #1)\if@tempswa~#2\fi} }$}

%% Narrow reference
%% Jakob's LaTeX tricks
\renewcommand\@biblabel[1]{#1)} % [1] --> 1)
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newdimen\bibspacing
\setlength\bibspacing\z@
\renewenvironment{thebibliography}[1]{%
   \section*{\refname
         \@mkboth{\refname}{\MakeUppercase\refname}}%
       \list{\@biblabel{\@arabic\c@enumiv}}%
            {\settowidth\labelwidth{\@biblabel{#1}}%
             \leftmargin\labelwidth
             \advance\leftmargin\labelsep
             \itemsep\z@skip    % should this be commented out?
             \parsep\z@skip     % should this be commented out?
             \@openbib@code
             \usecounter{enumiv}%
             \let\p@enumiv\@empty
             \renewcommand\theenumiv{\@arabic\c@enumiv}}%
       \sloppy\clubpenalty4000\widowpenalty4000%
       \sfcode`\.\@m}
      {\def\@noitemerr
        {\@latex@warning{Empty `thebibliography' environment}}%
       \endlist}
\setlength{\bibspacing}{\baselineskip}

\endinput