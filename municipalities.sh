#!/usr/bin/bash

# Downloads the current version of the HTML content of the Wikipedia page and saves it to a local file called wikihtml.txt. -# is used to display a progress bar instead of a meter.
curl -# -o wikihtml.txt https://en.wikipedia.org/wiki/List_of_municipalities_of_Norway

# First echo part used to put content at the top of the index.html.
echo "

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Municipalities of Norway</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <h1>List of municipalities of Norway</h1>
    <p>This is a list of all municipalities in Norway. It also includes population information, coat of arms and mayor etc.</p>
    <p>Exam ID: 10016</p>

" > index.html

# Stream Editor used to crop out the text in wikihtml.txt between the table start and table end, and appends the extracted text to the index.html.
sed -n '\|<table class="sortable wikitable">|,\|</table>|p' wikihtml.txt >> index.html

# Second echo to append bottom part of the index.html.
echo "

  </body>
</html>

" >> index.html
