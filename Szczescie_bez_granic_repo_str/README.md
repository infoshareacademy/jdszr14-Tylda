 -Szczeście bez granic
Cel: jak na przestrzeni lat zmieniał się poziom szczęścia w różnych krajach oraz co wpływało
na wyniki

-Struktura projektu:
1.Pozyskiwanie i przygotowanie danych - skrypty w folderze src/data_preparation/
2.Eksploracyjna analiza danych (EDA) - zrozumienie str danych, przechowujemy w notebooks
3.Analiza i wizualizacja - skrypty w src/analysis/ i src/visualization/
4.Modelowanie / Korelacje - umieszczamy w src/models/
5.Dokumentacja i raportowanie - wnioski oraz wszystkie istotne informacje można zgromadzić w raportach w reports/happiness_analysis/. Wykresy i inne obrazy zapisuj w reports/figures/.
6.Prezentacja - projekty w tableau/.
 
-Link do Tableau" 
-Link do Jiry - https://jira.is-academy.pl/secure/RapidBoard.jspa?rapidView=657&projectKey=JDSZR14T
-Co zostalo zrobione? Jakie analizy?" 
-Authors: Marcin Brysiak, Adriana Strugalska, Łukasz Zacharewicz
 -Struktura repo 
 Szczęście_bez_granic/
│
├── data/
│   ├── raw/           # Surowe dane, które pobieramy z https://www.kaggle.com/datasets/unsdsn/world-happiness
│   ├── processed/     # Przetworzone dane, gotowe do analizy
│   └── intermediate/  # Dane pośrednie
│
├── src/
│   ├── preprocessing/ # Skrypty do wstępnej obróbki danych
│   ├── analysis/      # Skrypty analizujące dane i wyciągające wnioski
│   └── visualization/ # Skrypty do wizualizacji wyników
│
├── docs/
│   ├── presentation/  # Prezentacje dotyczące projektu
│   └── materials/     # Dodatkowe materiały, np. artykuły, na których opiera się Twoja analiza
│
├── notebooks/         # Notatniki Jupyter z analizami i wizualizacjami
│
├── tableau/           # Pliki i zasoby związane z Tableau, jeśli je używasz
│
├── README.md          # Opis projektu, metodologii, linki do używanych narzędzi, autorzy itp.
│
└── .gitignore         # Plik, który mówi Gitowi, jakie pliki lub foldery pomijać