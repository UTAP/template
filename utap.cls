\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utap}

\LoadClass[a4paper, dvipsnames]{article}
\RequirePackage{kvoptions}
\RequirePackage{float}
\RequirePackage[inline]{enumitem}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{pstricks}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{tikz}
\RequirePackage{tikzscale}
\RequirePackage{tocbibind}
\RequirePackage{listings}
\RequirePackage[exponent-to-prefix]{siunitx}
\RequirePackage{fontspec}
\RequirePackage[normalem]{ulem}
\RequirePackage{array}
\RequirePackage[colorlinks, citecolor=Green, linkcolor=Red, filecolor=Cyan, urlcolor=Magenta]{hyperref}
% \RequirePackage{xepersian}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*

\makeatletter
\AtBeginDocument{
    \tolerance=5000
    \setlength{\parskip}{2ex plus1mm minus1mm}
    \settextfont[Path={./fonts/}, BoldFont={XB NiloofarBd.ttf}, BoldItalicFont={XB NiloofarBdIt.ttf}, ItalicFont={XB NiloofarIt.ttf}]{XB Niloofar.ttf}
    \setlatintextfont[Scale=0.8]{DejaVu Serif}
    \setmonofont[Scale=0.8]{DejaVu Sans Mono}
    \renewcommand{\labelitemi}{$\circ$}
    \renewcommand{\labelitemii}{$\diamond$}
    \lstset{
        language=C++,
        columns=flexible,
        basicstyle=\small\ttfamily\color{Gray},
        keywordstyle=\bfseries\color{Blue},
        keywordstyle={[2]\bfseries\color{BlueViolet}},
        stringstyle=\color{Red},
        commentstyle=\color{Green},
        identifierstyle=\color{Black},
        numbers=none,
        numberstyle=\scriptsize\rl,
        captionpos=b,
        breaklines=true,
        breakatwhitespace=true,
        showstringspaces=false,
        tabsize=4,
        morecomment=[l][\color{Sepia}]{\#}
    }
    \renewcommand{\maketitle}[0]{
        \clearpage
        {
            \begin{tikzpicture}[remember picture, overlay]
            \def\logosize{2cm}
            \node [anchor=south east, inner sep=0]  at (\textwidth-\parindent,0)
            {\resizebox{\logosize}{\logosize}{\input{ut}}};
            \draw[thick] (-\parindent,\logosize / 2) -- (\textwidth-\parindent-\logosize,\logosize / 2);
            \node [anchor=east, inner sep=0]  at (\textwidth-\parindent-\logosize,\logosize / 2 + \baselineskip) 
            {\Large \rl{\textbf{\@course}}};
            \node [anchor=west, inner sep=0]  at (-\parindent,\logosize / 2 + \baselineskip)
            {\large \rl{\@title}};
            \node [anchor=east, inner sep=0]  at (\textwidth-\parindent-\logosize,\logosize / 2 - \baselineskip) 
            {\small\rl{استاد: \textbf{\@lecturer}}};
            \node [anchor=west, inner sep=0]  at (-\parindent,\logosize / 2 - \baselineskip)
            {\small\rl{طراحان: \textbf{\@author}}};
            \if\@deadline
            \else
            \node [anchor=west, inner sep=0]  at (-\parindent,\logosize / 2 - 2 \baselineskip)
            {\footnotesize\rl{مهلت تحویل: \@deadline}};
            \fi
            \end{tikzpicture}
        }

    }

    \hypersetup{pdftitle=\@course\ :: \@title}
    \hypersetup{pdfauthor=\@author}
}

\definecolor{light-gray}{gray}{0.8}
\newcommand{\course}[1]{\def\@course{#1}}
\newcommand{\lecturer}[1]{\def\@lecturer{#1}}
\newcommand{\deadline}[1]{\def\@deadline{#1}}
\deadline{}
\newenvironment{inlinelist}[1][,\ ]{\begin{itemize*}[label={}, afterlabel={}, itemjoin={#1}, itemjoin*={\ and\ }]}{\end{itemize*}}

\makeatother
