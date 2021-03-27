# README

This is just a tiny experiment of what would be to create an old Choose Your Own Adventure like book by using ebook formats. To be precise, using Markdown as source format and epub as output.

The main idea is to use chapters as the old page markers, as in  "if you choose to open the door, go to page xxx", because with digital books pages are dynamic in size and amount, but chapter markers a) always denote the start of a new page and b) are easily referenced from anywhere.

**Rules**

The rules are quite simple: Always start at the first chapter, and always move to one of the choices you're given at the end of each chapter. Do not manually advance pages or you will spoil the fun.

## Running

Sample book is `input.md`. The image is mine and you can do whatever you want with it too.

```
make compile-epub
```

As this was a simple experiment I didn't setup any `.mobi` conversion, I simply use [Calibre](https://calibre-ebook.com/) to send the `epub` to my Kindle reader and it handles format change.

## Notes

To reference chapters, use lower-cased, `-` separated marker identifiers, e.g.
```
# Chapter One

...


[**Link to Chapter One**](#chapter-one)

```

As I'm using roman numerals for the markers, I put them in bold (e.g. `**IV**`) so they are easier to tap.

## Resources

- [Pandoc help](https://pandoc.org/help.html)
- [Great Markdown & Pandoc tutorial](https://www.flutterbys.com.au/stats/tut/tut17.3.html)
- Uses official [Docker Pandoc image](https://hub.docker.com/r/pandoc/core)
