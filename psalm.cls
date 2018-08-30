%% LaTeX class for typesetting psalms to Anglican chants

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{psalm}[2018/08/26 psalm class]

\LoadClass{article} % Must precede geometry package options

\RequirePackage{array}
\RequirePackage{textcomp}
\RequirePackage[top=2cm,bottom=2cm,left=1.5cm,right=1.5cm]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage{libertine}
\RequirePackage{graphicx}
\RequirePackage{tabu}

\pagestyle{empty}

% HORIZONTAL SPACING

\setlength{\tabcolsep}{0pt}

\setlength\parindent{0pt}

% amount of space for notes e.g. dynamics p mp mf f cresc. dim.
\newlength\notesamount
\setlength\notesamount{4em}

% amount of space for verse numbers
\newlength\versenumamount
\setlength\versenumamount{2em}

% amount to indent second half of each verse
\newlength\indentamount
\setlength\indentamount{1em}

% VERTICAL SPACING

% vertical space between verses
\newlength\versesepamount
\setlength\versesepamount{0.0em}

% vertical space between sections of psalm
\newlength\stanzagapamount
\setlength\stanzagapamount{1.2em}

% vertical space between sections of psalm
\newlength\gloriagapamount
\setlength\gloriagapamount{2.4em}

% define left- and right-aligned paragraph column for use below
\newcolumntype{R}[1]
  {>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{L}[1]
  {>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{T}
  {>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}X}

% verse number
\newcounter{VerseCounter}

% environment for psalm text
\newenvironment{psalmtext}[1][1]
{
  \setcounter{VerseCounter}{#1} % number of first verse
  \begin{tabu} to \textwidth {L{\notesamount} @{\hspace{2pt}} R{\versenumamount} @{\hspace{24pt}} T}
}
{
  \end{tabu}
}

\newcommand{\psalmtitle}[1]{
  \begin{center}
    {\Large \textbf{Psalm #1}}
  \end{center}
}

\newcommand{\chant}[1]{
  \begin{center}
    \includegraphics[resolution=600, scale=0.97]{#1}
  \end{center}
}

\newcommand{\psalmsubtitle}[1]{
  \begin{center}
    \textit{\textbf{#1}}
  \end{center}
}


% below we set some characters as 'active' characters,
% allowing them to be defined as macros

% bar line
\catcode`|=\active
\newcommand{|}{\textbar}

% p*ause between words
\catcode`^=\active
\newcommand{^}{*\space\space}

% dot for change of note (use instead of space between words)
\catcode`*=\active
\newcommand{*}{\hspace{0.15em}$\vcenter{\hbox{\tiny$\bullet$}}$\hspace{0.15em}}

% colon at midpoint of verse
\newcommand{\textcolon}{:}
\catcode`:=\active
\newcommand{:}{\space\textcolon}

% dynamics style
\newcommand{\dyn}[1]{\textbf{\textit{#1}}}

% dot above letter to denote syllable
\newcommand{\syl}[1]{\.{#1}}

% arrow to continue
\newcommand{\continue}{\textrightarrow}

% second half of the chant
\newcommand{\second}{\textdagger\thinspace}

% verses use the following columns:
% dynamics | daggers | verse numbers | verse text

% normal verse
\newcommand{\vs}[4]{\dyn{#1} & \theVerseCounter.\stepcounter{VerseCounter} & #2 \\
  \dyn{#3} & &\hspace{\indentamount}#4\\[\versesepamount]}

% full verse
\newcommand{\vsf}[4]{\dyn{#1} & \underline{\theVerseCounter}.\stepcounter{VerseCounter} & #2 \\
  \dyn{#3} & &\hspace{\indentamount}#4\\[\versesepamount]}

% verse without verse number e.g. Gloria
\newcommand{\vsn}[4]{\dyn{#1} & & #2 \\
  \dyn{#3} & &\hspace{\indentamount}#4\\[\versesepamount]}

% normal verse second half
\newcommand{\vsd}[4]{\dyn{#1} & \second\theVerseCounter.\stepcounter{VerseCounter} & #2 \\
  \dyn{#3} & &\hspace{\indentamount}#4\\[\versesepamount]}

% full verse second half
\newcommand{\vsfd}[4]{\dyn{#1} & \second\underline{\theVerseCounter}.\stepcounter{VerseCounter} & #2 \\
  \dyn{#3} & &\hspace{\indentamount}#4\\[\versesepamount]}

% verse second half without verse number e.g. Gloria
\newcommand{\vsnd}[4]{\dyn{#1} & \second & #2 \\
  \dyn{#3} & &\hspace{\indentamount}#4\\[\versesepamount]}

% break a long line and indent appropriately
\newcommand{\nextline}[1][]{\newline\dyn{#1}&&\hbox{}\hspace{2\indentamount}}

% gap to signify a new section of the psalm
\newcommand{\stanzagap}{\vspace{\stanzagapamount}\\[-12pt]}

% gap to signify the Gloria
\newcommand{\gloriagap}{\vspace{\gloriagapamount}\\[-12pt]}

\newcommand{\gloriafull}[1]{
  \gloriagap
  \vsn{#1}{Glory | be_to the | Father \q}
  {}{And to the Son | and_to the | Holy | Ghost;}
  \vsn{}{As it was in the beginning is now and | ever | shall || be world with_out end A- | men.}
  {}{}
}

\newcommand{\gloria}[1]{
  \begin{flushright}
    \dyn{#1}\hspace{4pt}\textbf{Gloria}\\
  \end{flushright}
}

