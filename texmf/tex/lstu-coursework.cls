\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lstu-coursework}[2020/03/20 LSTU CourseWork]

\LoadClass[14pt,a4paper]{extarticle}
\RequirePackage{indentfirst}
\RequirePackage{extsizes}
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

% Ученая степень
\def\academicTitle#1{\def\@academicTitle{#1}}
\academicTitle{}

% ФИО преподавателя
\def\teacher#1{\def\@teacher{#1}}
\teacher{}

% ФИО студента
\author{Федин М.С.}

\setmainfont{Times New Roman}
\setmonofont{RobotoMono Nerd Font}
\linespread{1.5}
\setlength\itemsep{0em}
\RequirePackage[compact]{titlesec}
% Изменение формата заголовков
\titlelabel{\hspace{1.25cm}\thetitle\quad}

\titleformat*
	{\section} % command
	{\normalfont\normalsize} % format

\titleformat*
	{\subsection} % command
	{\normalfont\normalsize} % format

\titleformat*
	{\subsubsection} % command
	{\normalfont\normalsize} % format

\setlength\parindent{1.25cm}

% Переопределение титульного листа
\renewcommand*{\maketitle}{
	\begin{titlepage}
		\baselineskip=21pt
		\begin{center}
			\textbf{Липецкий Государственный Технический Университет}\\
			Факультет \@faculty\\
			Кафедра \@department\\
			\vfill
			КУРСОВАЯ РАБОТА\\
			по курсу <<\@discipline>>\\
			\ifx\@title\empty
			\else
			<<\@title>>
			\fi
			\vfill
			Студент \hfill \@author\\
			\begin{flushleft}
				Группа ПИ-16
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
