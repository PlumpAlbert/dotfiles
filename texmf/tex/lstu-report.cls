% vim:ft=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lstu-report}[2020/02/22 LSTU Report]

\LoadClass[14pt,a4paper]{extarticle}
\RequirePackage{indentfirst}
%\RequirePackage{extsizes}
\RequirePackage{fontspec}
\RequirePackage[english,russian]{babel}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[
	labelsep=period
]{caption}
\RequirePackage[
left=25.00mm,
right=2.00cm,
top=2.00cm,
bottom=2.00cm]{geometry}

% Факультет
\def\faculty#1{\def\@faculty{#1}}
\faculty{автоматизации и информатики}

% Кафедра
\def\department#1{\def\@department{#1}}
\department{автоматизированных систем управления}

% Дисциплина
\def\discipline#1{\def\@discipline{#1}}
\discipline{Название дисциплины}

% Номер отчета
\def\reportNumber#1{\def\@reportNumber{#1}}
\reportNumber{1}

% Ученая степень
\def\academicTitle#1{\def\@academicTitle{#1}}
\academicTitle{ученая степень}

% ФИО преподавателя
\def\teacher#1{\def\@teacher{#1}}
\teacher{ФИО преподавателя}

% ФИО студента
\author{Федин М.С.}

% Группа
\def\group#1{\def\@group{#1}}
\group{ПИ-17}

\setmainfont{Times New Roman}
\setmonofont{Cascadia Code PL}
\linespread{1.5}
\setlength\itemsep{0em}
\renewcommand*{\maketitle}{
	\begin{titlepage}
		\baselineskip=21pt
		\begin{center}
			\textbf{Липецкий Государственный Технический Университет}\\
			Факультет \@faculty\\
			Кафедра \@department\\
			\vfill
			ЛАБОРАТОРНАЯ РАБОТА № \@reportNumber\\
			по курсу <<\@discipline>>\\
			\ifx\@title\empty
			\else
			<<\@title>>
			\fi
			\vfill
			Студент \hfill \@author\\
			\begin{flushleft}
        Группа \@group
			\end{flushleft}
			\begin{flushleft}
				Руководитель
			\end{flushleft}
			\@academicTitle \hfill \@teacher\\
			\mbox{}\\
			Липецк \the\year{ г}
		\end{center}
	\end{titlepage}
}

\RequirePackage{titlesec}

\titlelabel{\hspace{1.25cm}\thetitle\quad}

\titleformat
   {\section} % <command>
   {\normalfont\normalsize\bfseries} % <format>
   {\thesection.} % <label>
   {1em} % <sep>
   {} % <before-code>
\titlespacing{\section}{1.25cm}{*3}{0pt}

\titleformat
   {\subsection} % <command>
   {\normalfont\normalsize\bfseries} % <format>
   {\thesection.} % <label>
   {1em} % <sep>
   {} % <before-code>
\titlespacing{\subsection}{1.25cm}{*3}{0pt}


\titleformat
   {\subsubsection} % <command>
   {\normalfont\normalsize\bfseries} % <format>
   {\thesection.} % <label>
   {1em} % <sep>
   {} % <before-code>
\titlespacing{\subsubsection}{1.25cm}{*3}{0pt}

\setlength\parindent{1.25cm}
