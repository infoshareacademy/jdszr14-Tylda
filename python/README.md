PYTHON Project

OPIS
 TYTUŁ: 8. Panie Areczku, benefity są dla zarządu!

 CEL: jzbadanie nastrojów wśród pracowników organizacji, w kontekście ich możliwości awansu lub odejścia.
        Stakeholder: dział HR potrzebuje insightów na temat pracowników, 
        którzy odeszli z firmy i ryzyka jakim obarczone są osoby, 
        które przez dłuższy czas pozostają bez awansu.
....

STRUKTURA PROJEKTU
│ sql/
    ├── src/
    │   ├── create_table/           # Skrypty tworzenia tabel i import danych 
    │   │   ├──raw_data/            # Surowe dane, pobrane z https://www.kaggle.com/datasets/thedevastator/employee-attrition-and-factors
    │   │   └──create_table.sql
    │   ├── eda/                    # Skrypty wstępnej obróbki danych
    │   │   ├──........sql
    │   │   └──........sql
    │   ├── analysis/               # Skrypty analizujące dane i wyciągające wnioski
    │   │   └──........sql
    │   └── tableau/                # Skrypty do wizualizacji wyników
    │       └──........twbx
    │
    ├── docs/
    │   ├── presentation/           # Prezentacje projektu
    │   │   └──........pptx
    │   └── materials/              # Dodatkowe materiały, np. artykuły, na których opiera się analiza
    │       └──Python_projekty.pdf         
    │
    │
    └── README.md                   # Opis projektu, metodologii, linki do używanych narzędzi, autorzy itp.

LINKI 
Link do danych  - https://www.kaggle.com/datasets/thedevastator/employee-attrition-and-factors
Link do Tableau - https://public.tableau.com/....
Link do Jiry    - https://jira.is-academy.pl/....

ETAPY PROJEKTU - ANALIZY
1.  Pozyskiwanie i przygotowanie danych - skrypty w folderze src/data_preparation/
2.  Eksploracyjna analiza danych (EDA) - zrozumienie str danych, przechowujemy w notebooks
3.  Analiza i wizualizacja - skrypty w src/analysis/ i src/visualization/
4.  Modelowanie / Korelacje - umieszczamy w src/models/
5.  Dokumentacja i raportowanie - wnioski oraz wszystkie istotne informacje można zgromadzić w raportach w reports/analysis/. 
    Wykresy i inne obrazy zapisuj w reports/figures/.
6.  Prezentacja - projekty w tableau/.


AUTHORS:
BRYSIAK Marcin
FIGIEL Katarzyna
STRUGALSKA Adriana
ZACHAREWICZ Łukasz

=======
