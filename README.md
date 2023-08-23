# Wykaz imion używanych w Polskiej Rzeczypospolitej Ludowej

(i.e., list of names used in the Polish People's Republic)

## About

This repository stores data on names present in *Wykaz imion używanych w Polskiej Rzeczypospolitej Ludowej*, an article published in *Język Polski. 1983, nr 1/2 (styczeń/kwiecień)*.

The article presents a list of names that is still used by the Council for the Polish Language when opining on appropriate and inappropriate baby names.

From a native speaker's perspective, these names feel dated; many of them aren't in use anymore, and even more are rather obscure. However, it's an interesting source of information on names used in Poland until 1983 (with an additional caveat that the list comprises more than 1,000 names that have been selected based on the expert judgement of Józef Bubak and the Council for the Polish Language; the criteria aren't clear, but it seems that some names made the list because it was obvious they were popular; some were chosen because they were traditional Polish names).

For more, see:

-   <http://mbc.malopolska.pl/dlibra/docmetadata?id=24254>

## Data

The file you'll be interested in is `given_names.csv`. Here's an example of the first three rows:

| Name    | Form | Popular |
|---------|------|---------|
| Abdon   | m    | FALSE   |
| Abel    | m    | FALSE   |
| Abelard | m    | FALSE   |

: head of `given_names.csv`

-   `Name` - the given name (character strings with Polish diacritics)

-   `Form` - feminine or masculine, as indicated in the original list (`f` or `m`)

-   `Popular` - names deemed popular in the original list (`TRUE` or `FALSE`)

### Meta

-   Rows: 1,176

-   Columns: 3

-   Checked for typos multiple times, but might have missed a few spots
