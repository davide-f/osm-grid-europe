\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{response}[2020/12/18 Author Reviewer Response LaTeX class]

\LoadClass[11pt]{article}

% Layout
\RequirePackage[includeheadfoot,top=20mm, bottom=20mm, footskip=2.5cm]{geometry}

% Typography
\RequirePackage[T1]{fontenc}
\RequirePackage{libertine}
\RequirePackage{amssymb,amsmath}
\RequirePackage{microtype}
\RequirePackage[utf8]{inputenc}

% Misc
\RequirePackage{graphicx}
\RequirePackage[colorlinks=true,
linkcolor = blue,
urlcolor  = blue,
citecolor = blue,]{hyperref}
% \RequirePackage[square,sort&compress,numbers]{natbib}
\RequirePackage{listings}
\RequirePackage{enumitem}
\RequirePackage{xcolor}

% Table
\RequirePackage{adjustbox} % center large tables across textwidth by surrounding tabular with \begin{adjustbox}{center}
\renewcommand{\arraystretch}{1.2} % enlarge spacing between rows
\RequirePackage{caption} 
\captionsetup[table]{skip=10pt} % enlarge spacing between caption and table

% Section styles
\RequirePackage{titlesec}
\titleformat{\section}{\normalfont\large}{\makebox[0pt][r]{\bf \thesection.\hspace{4mm}}}{0em}{\bfseries}
\titleformat{\subsection}{\normalfont}{\makebox[0pt][r]{\bf \thesubsection.\hspace{4mm}}}{0em}{\bfseries}
\titlespacing{\subsection}{0em}{1em}{-0.3em} % left before after

% Paragraph styles
\setlength{\parskip}{0.6\baselineskip}%
\setlength{\parindent}{0pt}%

% Quotation styles
\RequirePackage{framed}
\let\oldquote=\quote
\let\endoldquote=\endquote
\renewenvironment{quote}{\begin{fquote}\itshape\advance\leftmargini -2.4em\begin{oldquote}}{\end{oldquote}\end{fquote}}
\newenvironment{fquote}
{\def\FrameCommand{
		\vrule width 2pt \hspace{10pt}}%
	\MakeFramed {\advance\hsize-\width \FrameRestore}
	\begin{minipage}{\linewidth}
	}
	{\end{minipage}\endMakeFramed}

% Table styles
\let\oldtabular=\tabular
\let\endoldtabular=\endtabular
\renewenvironment{tabular}[1]{\begin{adjustbox}{center}\begin{oldtabular}{#1}}{\end{oldtabular}\end{adjustbox}}

% Shortcuts

%% Add RC and AR to the left of a paragraph
%\def\RC{\makebox[0pt][r]{\bf RC:\hspace{4mm}}}
%\def\AR{\makebox[0pt][r]{AR:\hspace{4mm}}}

%% Define that \RC and \AR should start and format the whole paragraph 
\RequirePackage{suffix}
\long\def\EC#1\par{\makebox[0pt][r]{\color{gray}\textbf{EC:}\hspace{4mm}}{\color{gray}#1}\par} %\EC
\WithSuffix\long\def\EC*#1\par{\textbf{\color{gray}\textit{#1}}\par} %\RC*
\long\def\RC#1\par{\makebox[0pt][r]{\color{gray}\textbf{RC:}\hspace{4mm}}{\color{gray}#1}\par} %\RC
\WithSuffix\long\def\RC*#1\par{\textbf{\color{gray}\textit{#1}}\par} %\RC*
\long\def\AR#1\par{\makebox[0pt][r]{AR:\hspace{10pt}}#1\par} %\AR
\WithSuffix\long\def\AR*#1\par{#1\par} %\AR*

% Modify the number formatting for figures, equations,
% tables, and listings defined in the response letter so that 
% these are not confused with references to the manuscript.
\renewcommand{\thefigure}{R\arabic{figure}}
\renewcommand{\theequation}{R\arabic{equation}}
\renewcommand{\thetable}{R\arabic{table}} 
\renewcommand{\thesubsection}{Q\arabic{section}.\arabic{subsection}}

% Define title defaults if not defined by user
\providecommand{\lettertitle}{Author Response to Reviews of}
\newcommand{\authors}[1]{\def\@authors{#1}}
\newcommand{\journal}[1]{\def\@journal{#1}}
\newcommand{\iteration}[1]{\def\@iteration{#1}}

\renewcommand{\maketitle}{
	% Make title
	{\Large\bf \lettertitle}\\[1em]
	{\huge \@title}\\[1em]
	{\@authors}\\
	{\it \@journal}\\
	{Revision \#\@iteration: \@date}\\
	\hrule

	% Legend
	\hfill \textsf{\textbf{\color{gray}EC:}}
	\textsf{\color{gray}Editor Comment},\(\quad\)
	\textsf{\textbf{\color{gray}RC:}}
	\textsf{\color{gray}Reviewer Comment},\(\quad\)
	AR: Author Response,\(\quad\)
	\vrule width 3pt \hspace{5pt} {\textit{Manuscript text}}
	\vspace{1cm}
}

\urlstyle{sf}
