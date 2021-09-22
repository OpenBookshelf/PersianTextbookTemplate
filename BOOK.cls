%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%                                                                  %%%%%%
%%%%%%               Provided by: Behzad Shayegh Borujeni               %%%%%%
%%%%%%                  http://behzadshayegh.github.io                  %%%%%%
%%%%%%                                                                  %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\LoadClassWithOptions{article}
\usepackage[
    centering,
    includehead=true,
    paperwidth=17cm,
    paperheight=23cm,
    top=2cm,
    bottom=3cm,
    outer=2.5cm,
    inner=2.5cm
    ]{geometry}


\RequirePackage{xkeyval}

\def\docauthorname{A. U. Thor}
\def\docname{\jobname.tex}
\def\docdate{\today}


\define@key{BOOK.cls}{template_root}[.]{
  \def\templateroot{#1}
}

\define@key{BOOK.cls}{reference_icons}[.]{
  \def\referenceicons{#1}
}

\ExecuteOptionsX{template_root,reference_icons}
\ProcessOptionsX


\usepackage{xcolor}
\RequirePackage{graphicx,wrapfig}
\usepackage{enumitem}
\usepackage[most]{tcolorbox}
\setlength{\parindent}{4em}
\usetikzlibrary{calc}
\usepackage{subfiles}
\usepackage{fancyhdr}
\usepackage{amsfonts}
\usepackage{tikz}
\usepackage{import}
\usepackage{hyperref}
\usepackage{parskip}
\usepackage{longtable}
\usepackage{amsmath}
\usepackage{pbox}
\usepackage{amssymb}
\usepackage{xifthen}
\usepackage{extarrows}

\RequirePackage[extrafootnotefeatures]{xepersian}
\settextfont[
    Path={\templateroot/fonts/},
    BoldFont={B_Nazanin_Bold.ttf},
    ItalicFont={B_Nazanin_Italic.ttf},
    Scale=1.0
    ]{B_Nazanin.ttf}
% \setdigitfont[
%     Path={\templateroot/fonts/}
%     ]{IRZar.ttf}
\newfontfamily\Titr[
    Path={\templateroot/fonts/},
    ]{B_Titr_Bold.ttf}
\newfontfamily\Mitra[
    Path={\templateroot/fonts/},
    BoldFont={B_Mitra_Bold.ttf},
    ItalicFont={B_Mitra_Italic.ttf}
    ]{B_Mitra.ttf}
\newfontfamily\Yagut[
    Path={\templateroot/fonts/},
    BoldFont={B_Mitra_Bold.ttf},
    ]{B_Yagut.ttf}


\pagestyle{fancy}
\fancyhf{} 
\fancyfoot[RE,LO]{\thepage}
\fancyhead[RO,LE]{\leftmark} %inner head
\fancyhead[LO,RE]{\rightmark} %outer head

\newcommand{\centerimage}[2]{
    \begin{center}
        \includegraphics[width=#1\linewidth]{#2}        
    \end{center}
}

\renewcommand{\theenumi}{\Alph{enumi}}


\definecolor{crossrefblue}{RGB}{10,70,120}
\hypersetup{
    colorlinks=true,
    breaklinks=true,
    linkcolor=crossrefblue,
    urlcolor=blue,
}

% Colors
%--------------------------------------------------------------------------
% color palette: https://coolors.co/ffffff-000000-a33602-c7cc3e-3e3bbd-909d6c-7e93f1-030352-868686-a6af46
\RequirePackage{xcolor}
\definecolor{sectionblue}{RGB}{62, 59, 189}
\definecolor{subsectionblue}{RGB}{62, 59, 189}
\definecolor{extraorange}{RGB}{173, 177, 47}
\definecolor{extrayellow}{RGB}{166, 175, 70}
\definecolor{theoremblue}{RGB}{3, 3, 82}
\definecolor{definitiongreen}{RGB}{149, 157, 62}
\definecolor{definitionyellow}{RGB}{144, 157, 108}
\definecolor{focusedcolor}{RGB}{126, 147, 241}
\definecolor{problembordercolor}{RGB}{134, 134, 134}
\definecolor{solutiongreen}{RGB}{199, 204, 62}
\definecolor{solutionred}{RGB}{163, 54, 2}
\definecolor{darkgreen}{rgb}{0.2, 0.7, 0.33}
\definecolor{darkred}{rgb}{0.88, 0.35, 0.15}



% paragraph styling
%--------------------------------------------------------------------------
\newcommand{\p}[0]{
    
    \noindent
    \vspace{1mm}
    \hspace{5mm}
}


% cover styling
%--------------------------------------------------------------------------
\newcommand{\COVER}[1][\templateroot/images/background.jpg]{
    \newpage
    \thispagestyle{empty}

    \begin{tikzpicture}[remember picture,overlay]
        \node at (current page.north west) {
            \begin{tikzpicture}[remember picture,overlay]
                \node[anchor=north west,inner sep=0pt] at (0,0) {
                    \includegraphics[width=\paperwidth]{#1}
                };
            \end{tikzpicture}
        };
    \end{tikzpicture}
    \newpage
}

% tableofcontents styling
%--------------------------------------------------------------------------
\newcommand{\TOC}{
    \newpage
    \markboth{}{}
    \tableofcontents
    \markboth{فهرست مطالب}{}
    \newpage
}


% Chapter styling
%--------------------------------------------------------------------------
\newcounter{chapter}

\newcommand{\CHAPTER}[4][\templateroot/images/background.jpg]{
    \newpage
    \thispagestyle{empty}
    \refstepcounter{chapter}
    \markboth{\Titr\scriptsize #2}{}
    
    \begin{tikzpicture}[remember picture,overlay]
        \node at (current page.north west) {
            \begin{tikzpicture}[remember picture,overlay]
                \node[anchor=north west,inner sep=0pt] at (0,0) {
                    \includegraphics[width=\paperwidth, height=0.5\paperheight]{#1}
                };
            \end{tikzpicture}
        };
    \end{tikzpicture}
    
    \vspace*{\fill}

    {\Titr فصل \medskip{~\thechapter}}

    {\Titr\Huge #2}
    \addcontentsline{toc}{part}{\Large{\textbf{#2}}}
    
    \vspace{1.5cm}
    \p
    #3

    \begin{flushleft}
        عکس از:
        #4
    \end{flushleft}

    \newpage
}

% Section styling
%--------------------------------------------------------------------------
\newcommand{\SECTION}[1]{
    
    \section*{\color{sectionblue}{\Titr\LARGE #1}}
    \markright{\Titr\scriptsize #1}
    \addcontentsline{toc}{section}{#1}
    \vspace{-12mm}
    {\textcolor{sectionblue}{\noindent\rule{\textwidth}{0.8pt}}}
}

% SubSection styling
%--------------------------------------------------------------------------
\newcommand{\SUBSECTION}[1]{
    \subsection*{\hspace{7mm}\color{subsectionblue}{\Titr #1}}
    \addcontentsline{toc}{subsection}{\small{#1}}
    \vspace{-12mm}
    {\textcolor{subsectionblue}{\noindent\rule{0.4\textwidth}{0.8pt}}}
}

% Definition styling
%--------------------------------------------------------------------------
\newenvironment{DEFINITION}
{\begin{tcolorbox}[
    enhanced jigsaw,
    breakable,
    pad at break*=1mm,
    colback=definitionyellow!20,
    boxrule=0pt,
    frame hidden,
    borderline east={1.5mm}{0mm}{definitiongreen!90}
    ]}
{\end{tcolorbox}}

% focused
%--------------------------------------------------------------------------
\newcommand{\FOCUSEDON}[1]{‌\textbf{\color{focusedcolor}{#1}}}

% Note
%--------------------------------------------------------------------------
\newcommand{\NOTE}[2][-1.5cm]{
    \p
    {\hspace{#1}{\includegraphics[width=5mm]{\templateroot/images/notemark.png}}}
    \hspace{7mm} {\normalfont\itshape #2}
}

% theorem styling
%--------------------------------------------------------------------------
\newenvironment{THEOREM}
{\begin{tcolorbox}[
    enhanced jigsaw,
    breakable,
    pad at break*=1mm,
    colback=theoremblue!10,
    colframe=theoremblue!35
    ]}
{\end{tcolorbox}}


% reference
%--------------------------------------------------------------------------
\newcommand{\REF}[1]{\hyperlink{#1}{‌\includegraphics[height=5mm]{\referenceicons/#1.png}‌}}

\newcommand{\SOURCE}[1]{\hypertarget{#1}{\includegraphics[height=5mm]{\referenceicons/#1.png}}}

\newcommand{\SOURCELINE}[2]{
\SOURCE{#1}
#2
}

\newcommand{\LRTSOURCELINE}[2]{\lr{\LTR
\SOURCE{#1}
#2
}}


% cross referencing
%--------------------------------------------------------------------------
\newcommand{\CROSSREF}[2][]{\hyperlink{#2}{\ifthenelse{\isempty{#1}}{#2}{#1}(\includegraphics[height=2.5mm]{\templateroot/images/back.png})}}

\newcommand{\TARGET}[2][]{\hypertarget{#2}{#1}}


% problem styling
%--------------------------------------------------------------------------
\newcounter{problem}[chapter]

\newenvironment{PROBLEM}[1][]
{\begin{tcolorbox}[
    enhanced jigsaw,
    breakable,
    pad at break*=1mm,
    colback=white,
    boxrule=0pt,
    frame hidden,
    borderline east={1.5mm}{-2mm}{problembordercolor!10}]
    \Mitra
    \hspace{-6.5mm}\colorbox{problembordercolor!10}{\refstepcounter{problem}\par\medskip{~\theproblem}}
    \hspace{3mm}{\small\color{problembordercolor!75}{\textbf{#1}}}
    \vspace{2mm}

\vspace{1mm}}
{\end{tcolorbox}}


% solution styling
%--------------------------------------------------------------------------

% solution mark
\newcommand{\solutionmark}[1][پاسخ]{
    \vspace{2mm}\hspace{0mm}{\small\color{solutiongreen}{\textbf{#1}}}
}

% solution
\newcommand{\SOLUTION}[2][پاسخ]{
    \Mitra\itshape

    \solutionmark[#1]
    \vspace{2mm}

    #2
}



% end problem styling
%--------------------------------------------------------------------------
\newcommand{\COLOREDEPROBLEM}[3][]{
    \begin{tcolorbox}[
        enhanced jigsaw,
        breakable,
        pad at break*=1mm,
        colback=white,
        boxrule=0pt,
        frame hidden,
        borderline north={1.5mm}{-1mm}{#2}]
    \Mitra
    \vspace{-10mm}\hspace{-5mm}{\colorbox{#2}{\refstepcounter{problem}\par\medskip{~\theproblem} #1}}
    \end{tcolorbox}
    \vspace{1mm}
    {\Mitra #3}
}

\newcommand{\EPROBLEM}[2][]{
    \COLOREDEPROBLEM[#1]{problembordercolor!10}{#2}
}

% end wrong solution  styling
%--------------------------------------------------------------------------

%  wrong solution mark
\newcommand{\EWsolutionmark}[1][پاسخ غلط]{
    \vspace{-3mm}\hspace{-6mm}\colorbox{solutionred!35}{\color{white}{ #1 }}
    \vspace{1mm}
}

%  wrong solution
\newcommand{\EWSOLUTION}[2][پاسخ غلط]{
    \begin{tcolorbox}[
        enhanced jigsaw,
        breakable,
        pad at break*=1mm,
        colback=white,
        boxrule=0pt,
        frame hidden,
        borderline east={1.5mm}{-2mm}{solutionred!35}]
        \Mitra\itshape

        \EWsolutionmark[#1]
        
        \begin{itshape}
            #2
        \end{itshape}

    \end{tcolorbox}
}

% end solution styling
%--------------------------------------------------------------------------

% end problem solution mark
\newcommand{\Esolutionmark}[1][پاسخ]{
    \vspace{-3mm}\hspace{-6mm}\colorbox{solutiongreen!50}{\color{white}{ #1 }}
    \vspace{1mm}
}

% end problem solution
\newcommand{\ESOLUTION}[2][پاسخ]{
    \begin{tcolorbox}[
        enhanced jigsaw,
        breakable,
        pad at break*=1mm,
        colback=white,
        boxrule=0pt,
        frame hidden,
        borderline east={1.5mm}{-2mm}{solutiongreen!50}]
        \Mitra\itshape

        \Esolutionmark[#1]
        
        \begin{itshape}
            #2
        \end{itshape}

    \end{tcolorbox}
}


% exercise styling
%--------------------------------------------------------------------------
\newcounter{exercise}[chapter]

\newcommand{\EXERCISE}[0]{

    \refstepcounter{exercise}\par\medskip{~\theexercise}.
}

% extra styling
%--------------------------------------------------------------------------
\newenvironment{EXTRA}[2][\templateroot/images/mindset.png]
{\begin{tcolorbox}[
    enhanced jigsaw,
    breakable,
    pad at break*=1mm,
    colback=extrayellow!30,
    colframe=extraorange]
    \Yagut
    \begin{flushleft}
        \vspace{-1.1cm}
        \hspace*{-1.5in}\includegraphics[width=0.15\linewidth]{#1}
    \end{flushleft}
    \begin{center}
        \vspace{-0.5cm}
        \textbf{\color{extraorange}{#2}}
        \vspace{0.3cm}
    \end{center}
}
{\end{tcolorbox}}


% affiliation
%--------------------------------------------------------------------------
\newenvironment{AFFILIATIONS}
{   
    \begin{center}
    \setlength\LTleft{0pt}
    \setlength\LTright{0pt}
    \begin{longtable}{@{\extracolsep{\fill}} c c c @{}}
}
{   
    \end{longtable}
    \end{center}
    \vspace{-1cm}
}

\newcommand{\AFFILIATIONURL}[2]{
    \href{#2}{\lr{\pbox{0.3\textwidth}{#1}}}
}
    
\newcommand{\AFFILIATIONROW}[9]{
    \pbox{0.3\textwidth}{#1} & \pbox{0.3\textwidth}{#4} & \pbox{0.3\textwidth}{#7} \\
    \tiny{\pbox{0.3\textwidth}{\centering#2}} & \tiny{\pbox{0.3\textwidth}{\centering#5}} & \tiny{\pbox{0.3\textwidth}{\centering#8}} \\
    \tiny{#3} & \tiny{#6} & \tiny{#9} \\
}


% CODE styling
%--------------------------------------------------------------------------
\lstset
{
    language=C++,
    basicstyle=\scriptsize\color{darkred}\ttfamily,
    identifierstyle=\color{black}\ttfamily,
    keywordstyle=\color{blue}\ttfamily,
    stringstyle=\color{orange}\ttfamily,
    commentstyle=\color{gray}\ttfamily,
    numbers=left,
    numbersep=10pt,
    numberstyle=\footnotesize\color{lightgray}\ttfamily,
    backgroundcolor = \color{lightgray!35},
    framexleftmargin = 1em,
        literate=*
        {0}{{{\color{black}0}}}{1}
        {1}{{{\color{black}1}}}{1}
        {2}{{{\color{black}2}}}{1}
        {3}{{{\color{black}3}}}{1}
        {4}{{{\color{black}4}}}{1}
        {5}{{{\color{black}5}}}{1}
        {6}{{{\color{black}6}}}{1}
        {7}{{{\color{black}7}}}{1}
        {8}{{{\color{black}8}}}{1}
        {9}{{{\color{black}9}}}{1}
        {.}{{{\color{black}.}}}{1}
        {;}{{{\color{darkgreen};}}}{1},
}
\newcommand{\CODE}[1]{
    \LR{
        \lstinputlisting{#1}
    }
}