SQL Project

OPIS
 TYTUŁ: Szczęście bez granic
 CEL: jak na przestrzeni lat zmieniał się poziom szczęścia w różnych krajach oraz co wpływało na wyniki
....

STRUKTURA PROJEKTU
│ sql/
    ├── src/
    │   ├── create_table/           # Skrypty tworzenia tabel i import danych 
    │   │   ├──raw_data/            # Surowe dane, pobrane z https://www.kaggle.com/datasets/unsdsn/world-happiness
    │   │   └──create_table.sql
    │   ├── eda/                    # Skrypty wstępnej obróbki danych
    │   │   ├──assigning_countries_to_regions.sql
    │   │   └──update_2018_year.sql
    │   ├── analysis/               # Skrypty analizujące dane i wyciągające wnioski
    │   │   └──new_correlation.sql
    │   └── tableau/                # Skrypty do wizualizacji wyników
    │       └──world_happiness_report.twbx
    │
    ├── docs/
    │   ├── presentation/           # Prezentacje projektu
    │   │   └──happiness_ver1.pptx
    │   └── materials/              # Dodatkowe materiały, np. artykuły, na których opiera się analiza
    │       └──przykładowe_tematy.pdf         
    │
    │
    └── README.md                   # Opis projektu, metodologii, linki do używanych narzędzi, autorzy itp.

LINKI 
Link do Tableau - https://public.tableau.com/app/profile/lukasz7850/viz/WorldHappinessReport_16983100475110/WorldHappinessReport
Link do Jiry    - https://jira.is-academy.pl/secure/RapidBoard.jspa?rapidView=657&projectKey=JDSZR14T

ETAPY PROJEKTU - ANALIZY
1.  Pozyskiwanie i przygotowanie danych - skrypty w folderze src/data_preparation/
2.  Eksploracyjna analiza danych (EDA) - zrozumienie str danych, przechowujemy w notebooks
3.  Analiza i wizualizacja - skrypty w src/analysis/ i src/visualization/
4.  Modelowanie / Korelacje - umieszczamy w src/models/
5.  Dokumentacja i raportowanie - wnioski oraz wszystkie istotne informacje można zgromadzić w raportach w reports/happiness_analysis/. 
    Wykresy i inne obrazy zapisuj w reports/figures/.
6.  Prezentacja - projekty w tableau/.


AUTHORS:
BRYSIAK Marcin
STRUGALSKA Adriana
ZACHAREWICZ Łukasz


=======
