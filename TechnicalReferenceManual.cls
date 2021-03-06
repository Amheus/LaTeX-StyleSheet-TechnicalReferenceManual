\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TechnicalReferenceManual}
\LoadClass[twoside,12pt,a4paper]{report}
\raggedbottom

\RequirePackage{fullpage}
\RequirePackage[a4paper,top=2.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm]{geometry}
\RequirePackage{parskip}
\RequirePackage{fontspec}
\RequirePackage[sfdefault]{atkinson}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{color}
\RequirePackage{microtype}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{lscape}
\RequirePackage[tikz]{bclogo}
\RequirePackage[strict]{changepage}
\RequirePackage{fancyhdr}
%\RequirePackage{enumitem}

\lstset{
	basicstyle=\ttfamily,
	columns=fullflexible,
	frame=single,
	breaklines=true,
	postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},
}

\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}

\linespread{1}

\DeclareRobustCommand*{\logo}[1]{\gdef\@logoCMD{#1}}
\DeclareRobustCommand*{\subtitle}[1]{\gdef\@subtitleCMD{#1}}
\DeclareRobustCommand*{\source}[1]{\gdef\@sourceCMD{#1}}
\DeclareRobustCommand*{\contact}[1]{\gdef\@contactCMD{#1}}
\DeclareRobustCommand*{\version}[1]{\gdef\@versionCMD{#1}}
\DeclareRobustCommand*{\manualversion}[1]{\gdef\@technicalReferenceManualVersionCMD{#1}}


\gdef\@versionCMD{\@latex@warning{No \version specified, ignoring.}}






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEADERS AND FOOTERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}

\fancyhead{}
\fancyfoot{}

\fancyfoot[LO, RE] {\textbf{\thepage}}
\fancyfoot[RO]{\textit{\@title}}
%\fancyfoot[LE]{\textit{\thechapter --- \chaptername --- \chaptermark}}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{1pt}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLE PAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\maketitle
{
	\begin{titlepage}
		\includegraphics[height=2cm]{\@logoCMD}
		
		\vfill
		{
			\begin{flushright}
				\huge{\@title\\\@subtitleCMD}
				\ifx\version\undefined
				\\
				\large{For }
				\huge{\@title \space \@versionCMD}
				\fi
				\\
				\large{Documentation Version \@technicalReferenceManualVersionCMD}
			\end{flushright}
		}
		\addvspace{10em}
		
		\pagebreak
		
		\vfill{~}
		\vfill
		{
			\begin{center}
				\@author
				\\
				Last Updated \@date
				\\
				\@sourceCMD
				\\
				\@contactCMD
			\end{center}
		}
		\vfill{
			\begin{center}
				\small{LaTeX template source:}
				\\\small{https://github.com/Amheus/LaTeX-StyleSheet-TechnicalReferenceManual}
			\end{center}
		}
		\vfill{~}
		
	\end{titlepage}
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BACK PAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\makebackcover
{
	\pagebreak
	
	\vfill{~}
	\vfill{~}
	
	%\includegraphics[width=8cm]{\@logoCMD}
	\colorbox{gray!25}
	{
		\begin{minipage}{20cm}
			\begin{minipage}{15cm}
				\includegraphics[height=2cm]{\@logoCMD}
			\end{minipage}
		\end{minipage}
		
	}
	
	\par{~}
	\par{~}
	
	\colorbox{gray!25}
	{
		\begin{minipage}{20cm}
			\begin{minipage}{15cm}
				~
				
				\large{Technical Support}
				\hfill
				\large{Documentation Version}
				
				~
				
				{contact us at\\\texttt{\@contactCMD}}
				\hfill
				\large{\@technicalReferenceManualVersionCMD}
				
				~
			\end{minipage}
		\end{minipage}
		
	}
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INTENTIONALLY BLANK PAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\intentionallyBlankPage
{
	\vfill{~}\vfill{~}
	\begin{center}
		\huge{This page is left intentionally blank.}
	\end{center}
	\vfill{~}
	\pagebreak
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 'PART' TITLE PAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BASED OFF https://www.tug.org/svn/texlive/trunk/Master/texmf-dist/tex/latex/base/report.cls?view=co
\renewcommand\part{
	\checkoddpage\ifoddpage\par{~}\else\intentionallyBlankPage\fi
	
	\thispagestyle{plain}
	
	\if@twocolumn
		\onecolumn
		\@tempswatrue
	\else
		\@tempswafalse
	\fi
	
	\null\vfil\vfil\vfil\vfil\vfil
	
	\secdef\@part\@spart
}


\def\@part[#1]#2{
	\refstepcounter{part}
	\addcontentsline{toc}{part}{Part: \thepart\hspace{1em}#1}
	
	\colorbox{gray!25}
	{
		\begin{minipage}{20cm}
			\begin{minipage}{15cm}
				\markboth{}{}
				{
					\interlinepenalty\@M
					\normalfont
					\LARGE\bfseries\partname\nobreakspace\thepart:\\\fontsize{37.5}{37.5}\selectfont{\bfseries{#2\par}}
					
				}
			\end{minipage}
		\end{minipage}
		
	}
	\@endpart
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AT END PREAMBLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtEndPreamble
{
	\@ifpackageloaded{hyperref}
	{
		\RequirePackage{xcolor}
		\providecolor{bluelinkcolour}{HTML}{0000A0}
		\hypersetup{colorlinks,allcolors=bluelinkcolour}
	}{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
