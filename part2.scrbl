#lang scribble/doc
@(require scribble/core) 
@(require scribble/manual)
@(require scribble/bnf)
@(require "lang/lexer.scm")
@(define (todo . s)
   (let [(text (list (string-append "TODO " (car s))))]
     (red-text text))) 
@(define (green-text . s)
   @italic[@elem[s #:style (style #f (list (color-property "green")))]]) 
@(define (black-text . s)
   @elem[s #:style (style #f (list (color-property "black")))]) 
@(define (red-text . s)
   @elem[s #:style (style #f (list (color-property "red")))]) 
@(define (blue-text . s)
   @elem[s #:style (style #f (list (color-property "blue")))]) 
@(define (1C-colorize x y)
   (cond 
     [(keyword?  x) (red-text (string-titlecase y))]
     [(eq? 'tknID x) (blue-text y)]
     [(eq? 'tknSTRING x) (black-text (string-append "\"" y "\""))]
     [(eq? 'tknNUMBER x) (black-text y)]
     [(eq? 'tknWS x) (hspace (string-length y))]
     [(eq? 'tknNL x) (linebreak)]
     [(eq? 'tknSQEUENCE x) (green-text y)]
     [else  (red-text y)]))

@(define (1C . s)
   (let [(token-list (lex->list s))]
     (map (lambda (x) (1C-colorize (car x) (cadr x))) token-list))) 
@title[#:version "0.1"
                 #:date "2014-11-24"]{Разработка синтаксического анализатора языка запросов на языке 1С}
@(author+email "Бомбин Валентин" "wwall@yandex.ru" #:obfuscate? #f)
@;----@local-table-of-contents[]
@section{О чем будем говорить?}
Сегодня мы поговорим о том как имя примитивные парсеры описанные в предыдущей статье собрать простой генератор синтаксических анализаторов, построим парсеры для пары простых грамматик и сделаем парсер для языка запросов. Тема кеширования и получения позиции откладывается до следующей статьи.
Из инструментов чуть позже потребуется утилита v8Unpack
@section{Разбор арифметического выражения}
Начнем мы с простого - напишем парсер для грамматики разбора арифметических выражений. Сама грамматика представлена ниже
@BNF[(list @nonterm{exp}
           @BNF-seq[@nonterm{number} @nonterm{operation} @nonterm{number}])
     (list @nonterm{operation} @BNF-alt[@litchar{+} @litchar{-}])
     (list @nonterm{number}
           @BNF-seq[@nonterm{digits} @optional[@BNF-group[@litchar{.} @nonterm{digits}]]])
     (list @nonterm{digits} @kleeneplus[@nonterm{@optional[@BNF-seq[@litchar{0-9}]]}])]
@para{Конечно же бросается в глаза ущербность грамматики, но поводов перживать нет - по ходу статьи будут добавлены недостающие операции и скобки. Сейчас для вас главное понять как формальное определение преобразуется в код, разбирающий строку.}
@subsection{Некрасивая, но нужная реализация}
@subsection{Сделаем симпатично}
@para{Напишем простой тест для проверки тестовой грамматики}
@subsection{Включим наконец мозг}
@subsubsection{Для чего?}
@subsubsection{Как?}
@subsubsection{Что получилось?}      
@subsubsection{Для чего эти муки?}
@section{Не пишите код}

@subsection{Почему код не надо писать?}
@subsection{Из чего состоит генератор?}
@subsection{Что бы понять рекурсию - надо понять рекурсию}
@subsection{Отключим мозг - включим фантазию}
@subsection{Лень - высшая форма труда}
@subsection{Что получилось? Вариант 1}
@subsection{А если подумать? Вариант 2}
@subsection{Пример использования - markdown}
@subsection{Еще немного косметики - v8Unpack}

@section{Парсер языка запросов для 1С}


@section{А что дальше?}
@section{Пару слов в заключении}
