#set text(lang: "pl", overhang: true)
#set par(justify: true)
#set heading(numbering: "1.1.")

#align(center)[
    #text([Bezpieczny i łatwy w konfiguracji sieciowy system plików], size: 20pt)
]

#let autor(imie, indeks) = {
    align(center, {
        [#imie]
        [\ #indeks]
    })
}

#grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 12pt,
    autor([Mikołaj Klikowicz], 193264),
    autor([Aleksander Iwicki], 199354),
    autor([Piotr Trybisz], 193557),
    autor([Wiktor Gawroński], 193285),
)

#v(1cm)
// #pagebreak(weak: true)
#outline()
#pagebreak(weak: true)

= Short description of the project

Celem projektu jest zaproponowanie oraz weryfikacja podejścia do budowy lub wdrażania bezpiecznych systemów plików działających w warstwie sieciowej. Rozwiązanie to powinno charakteryzować się wysokim poziomem ochrony danych przy jednoczesnym zachowaniu prostoty konfiguracji i administracji. Projekt skupia się na optymalnym kompromisie między bezpieczeństwem, łatwością zarządzania a narzutem wydajnościowym.

= Systematic Literature Review plan

== Goals and questions
Celem systematycznego przeglądu literatury (SLR) jest identyfikacja i porównanie mechanizmów oraz rozwiązań architektonicznych z zakresu sieciowych i rozproszonych systemów plików. Przegląd ma wskazać podejścia równoważące wymagania ochrony danych i łatwości zarządzania.

Postawiono następujące pytania badawcze:
- RQ1. Jakie typy sieciowych i rozproszonych systemów plików są najczęściej opisywane w literaturze w kontekście bezpieczeństwa?
- RQ2. Jakie mechanizmy bezpieczeństwa są stosowane w tych systemach (np. szyfrowanie, uwierzytelnianie, autoryzacja, zarządzanie kluczami)?
- RQ3. Jakie rozwiązania architektoniczne wspierają prostą konfigurację i administrację (np. centralizacja polityk, automatyzacja wdrożeń)?
- RQ4. Jakie kompromisy występują między bezpieczeństwem, wydajnością, skalowalnością a łatwością użycia?
- RQ5. Które z rozwiązań zostały zweryfikowane eksperymentalnie lub wdrożone w środowisku przemysłowym?

== Keywords
Poniżej znajduje się zestaw słów kluczowych wraz z synonimami:

*Sieciowe i rozproszone systemy plików*:
network file system, distributed file system, NFS, NFSv4, pNFS, AFS, SMB, CIFS, GlusterFS, Samba.

*Mechanizmy bezpieczeństwa*:
security, encryption, cryptograph, authentication, authorization, access control, Kerberos, TLS.

*Terminy wykluczane (z uwagi na częste kolizje skrótów takich jak "NFS" z innymi dziedzinami nauki)*:
blockchain, TNFS, hadoop, antenna, 5G, 6G, broadband, UAV, phishing.

== Search strings
Główne zapytanie wyszukujące zastosowane do przeglądu:

```SQL
TITLE("network file system" OR "distributed file system" OR "NFS" OR "NFSv4" OR "pNFS" OR "AFS" OR "SMB" OR "CIFS" OR "GlusterFS" OR "Samba")
AND TITLE-ABS-KEY("security" OR "encryption" OR "cryptograph*" OR "authentication" OR "authorization" OR "access control" OR "Kerberos" OR "TLS")
AND NOT TITLE-ABS-KEY("blockchain" OR "TNFS" OR "hadoop" OR "antenna" OR "5G" OR "6G" OR "broadband" OR "UAV") 
AND NOT ("phishing")
AND PUBYEAR > 2019
```

Zapytanie to było bazą dostosowaną składniowo do poszczególnych wyszukiwarek naukowych. Wyszukiwanie obejmowało wyłącznie publikacje z lat 2020 i nowszych (filtrowano z poziomu interfejsów baz).

== Literature databases
Rejestr składa się z trzech poniższych baz:
- Scopus
- IEEE Xplore
- SpringerLink

== Inclusion criteria
Kryteria włączenia artykułów:
- Rok publikacji: 2020 i nowsze.
- Język: prace anglojęzyczne.
- Typ publikacji: recenzowane artykuły branżowe i naukowe.
- Zakres tematyczny: poruszenie tematyki działania sieciowego lub rozproszonego systemu plików.
- Mechanizmy bezpieczeństwa: praca zgłębia przynajmniej jeden mechanizm bezpieczeństwa, uwierzytelniania, audytu lub schemat zastosowanego szyfrowania.


== Exclusion criteria
Kryteria odrzucenia (wykluczenia):
- Publikacje całkowicie omijające tematykę warstwy systemów plików.
- Prace koncentrujące się wyłącznie na ogólnych aspektach pamięci chmurowej (cloud storage) bez szczegółów dotyczących warstwy wymiany plików.
- Pozycje dotyczące tematyki 5G, anten lub blockchaina, które znalazły się w wynikach przez pomyłkowe dopasowanie wieloznacznych skrótów.
- Prace stanowiące jedynie koncepcje bez weryfikacji
== Quality criteria
Kryteria oceny jakości (Quality Assessment, QA) zastosowane do kwalifikacji publikacji do ekstrakcji danych (z naciskiem na rozwiązania przydatne w małym, lokalnym środowisku LAN/NAS):

- *QA1.* Czy praca zawiera wyniki empiryczne (a nie wyłącznie koncepcję/rozważania teoretyczne)?
- *QA2.* Czy jasno określono cel bezpieczeństwa i/lub model zagrożeń (np. podsłuch w LAN, ransomware, nadużycia uprawnień)?
- *QA3.* Czy opisano badany system/protokół oraz scenariusz wdrożeniowy (SMB/NFS/DFS, LAN/NAS vs chmura/HPC)?
- *QA4.* Czy mechanizm bezpieczeństwa jest opisany na tyle szczegółowo, aby móc ocenić integrację i koszty wdrożenia/utrzymania?
- *QA5.* Czy ewaluacja jest odpowiednia (punkt odniesienia + metryki przepustowości/opóźnień/narzutu/zużycia CPU i RAM dla operacji plikowych)?
- *QA6.* Czy omówiono kompromisy bezpieczeństwo–wydajność–użyteczność oraz aspekty administracyjne (konfiguracja, kompatybilność)?
- *QA7.* Czy procedura i środowisko testowe są opisane na tyle, aby zapewnić powtarzalność?
- *QA8.* Czy wskazano ograniczenia oraz zagrożenia dla trafności wyników (limitations/threats to validity)?


== Data extraction
Dla każdej publikacji zweryfikowano następujące dane:

- Metadane (rok, źródło, DOI/URL).
- Typ systemu i protokół (np. SMB/CIFS, NFS, DFS) oraz zakładane środowisko (LAN/NAS vs chmura).
- Opis mechanizmów bezpieczeństwa (szyfrowanie w transporcie, uwierzytelnianie, autoryzacja/ACL, audyt, DLP, ochrona przed ransomware, zarządzanie kluczami — jeśli dotyczy).
- Aspekty wdrożeniowe i administracyjne (wymagane komponenty, kroki konfiguracji, kompatybilność, ograniczenia).
- Metody ewaluacji i metryki.
- Najważniejsze wnioski, kompromisy oraz ograniczenia.

== SLR process

1. *Planowanie*  
  - Wszyscy członkowie zespołu wspólnie ustalili cele badawcze oraz pytania badawcze (RQ), a także strukturę procesu ekstrakcji danych.

2. *Wybór baz artykułów*  
  - Wybrane zostały trzy główne bazy literatury naukowej: Scopus, IEEE Xplore oraz SpringerLink.

3. *Doprecyzowanie zapytań wyszukiwawczych*  
  - Opracowano szczegółowe zapytania wyszukiwawcze oparte na słowach kluczowych i operatorach logicznych, dostosowane składniowo do każdej z baz.

4. *Walidacja i dostosowanie kryteriów włączenia*  
  - Zdefiniowano oraz zweryfikowano kryteria włączenia i wykluczenia publikacji, aby zapewnić zgodność wyników z zakresem tematycznym przeglądu.

5. *Surowe wyniki wyszukiwania*  
  - Z wybranych baz pobrano wyniki wyszukiwania w ilościach przedstawionych w sekcji „Results in numbers”.

6. *Usuwanie duplikatów*  
  - Do identyfikacji i usuwania duplikatów wykorzystano narzędzie Zotero.

7. *Selekcja na podstawie tytułu i streszczenia artykułu*  
  - Wstępna selekcja publikacji została przeprowadzona na podstawie tytułów i abstraktów z wykorzystaniem programu Zotero.

8. *Selekcja na podstawie pełnego tekstu*  
  - Każdy członek zespołu przeprowadził analizę części artykułów. Sprawdzono zgodność z pytaniami badawczymi oraz z kryteriami jakości.

9. *Ekstrakcja danych badawczych i synteza*  
  - Z każdego zakwalifikowanego artykułu wyodrębniono kluczowe informacje, takie jak: zastosowane mechanizmy bezpieczeństwa, architektura systemu, metody ewaluacji oraz główne wnioski. Dane zostały ujednolicone i zestawione w tabelach, co umożliwiło przeprowadzenie syntezy jakościowej.

10. *Raportowanie*  
  - Na podstawie zebranych i przeanalizowanych danych opracowano końcowy raport zawierający wyniki przeglądu oraz wnioski projektowe.

== Results in numbers
Liczba znalezionych publikacji w poszczególnych bazach przed usunięciem duplikatów i selekcją:
- Scopus: 20
- IEEE Xplore: 127
- SpringerLink: 159

== Articles selected for data extraction
Poniższa lista przedstawia 12 artykułów wybranych po weryfikacji i zakwalifikowanych do ekstrakcji danych:
- @mahboubi_file_2024 ("File System Shield (FSS): A Pass-Through Strategy...")
- @lin_knfs_2024 ("KNFS: A High-Performance, Security-Enhanced NFS...")
- @montano_secure_2022 ("Secure File Systems for the Development of a DLP...")
- @di_girolamo_building_2022 ("Building Blocks for Network-Accelerated Distributed File Systems")
- @yanakieva_access_2021 ("Access control conflict resolution in distributed file systems...")
- @ciucanu_samba_2023 ("SAMBA: A Generic Framework for Secure Federated Multi-Armed Bandits")
- @madana_mitigating_2021 ("Mitigating Storage Challenges through Configuring NAS...")
- @tiwari_strengthening_2024 ("Strengthening Information Relay by Using a Robust IEP...")
- @hilgert_mount_2024 ("Mount SMB.pcap: Reconstructing file systems...")
- @mitrovic_smb_2025 ("SMB Over QUIC: A Performance Evaluation")
- @cho_arkfs_2023 ("ArkFS: A Distributed File System on Object Storage...")
- @xu_practical_2022 ("Practical optimizations for lightweight distributed file system...")


== Initial extracted data

#table(
  columns: (35%, 35%, 30%),
  align: left,
  stroke: 0.5pt,
  fill: (col, row) => if row == 0 { luma(230) } else { none },
  [*Artykuł*], [*Główne słowa kluczowe*], [*Protokół*],

  [[1] --- SMB Over QUIC: A Performance Evaluation \ @mitrovic_smb_2025],
  [QUIC protocol, SMB throughput, performance metrics, CPU load],
  [SMB],
  table.cell(colspan: 3)[Przedmiotem artykułu jest ocena wydajności protokołu SMB przesyłanego przez sieć z użyciem QUIC zamiast TCP. Przeprowadzono pomiary obciążenia procesora i pamięci na serwerach Windows. Wyniki pokazują, że QUIC, posiadając wbudowane szyfrowanie TLS, pozwala na bezpieczne udostępnianie plików bez trudnej konfiguracji sieci VPN. Jest to świetny przykład kompromisu między bezpieczeństwem a łatwością wdrożenia i użycia sieciowych systemów plików.],

  [[2] --- KNFS: A High-Performance, Security-Enhanced NFS Based on eBPF \ @lin_knfs_2024],
  [eBPF, performance optimization, ACL, kernel bypass],
  [NFS],
  table.cell(colspan: 3)[Artykuł przedstawia ulepszoną architekturę NFS. Wykorzystano technologię eBPF działającą bezpośrednio w jądrze Linuksa do monitorowania ruchu i sprawdzania list dostępu (ACL). Testy wykazały, że eBPF weryfikuje uprawnienia z bardzo małym opóźnieniem i nie obciąża znacznie procesora, dając lepsze wyniki niż np. iptables. Praca pokazuje, jak osiągnąć wysoki poziom bezpieczeństwa autoryzacji bez zauważalnego spadku wydajności serwera.],

  [[3] --- Practical optimizations for lightweight distributed file system on consumer devices \ @xu_practical_2022],
  [Lightweight DFS, consumer hardware, access protocol, WLAN],
  [Lekki DFS],
  table.cell(colspan: 3)[Praca opisuje lekkie rozproszone systemy plików dla sprzętu konsumenckiego lub małych firm (dyski NAS). Autorzy stworzyli prosty mechanizm przydzielania dostępu do plików, rezygnując ze skomplikowanych uprawnień standardu POSIX. Nowy protokół jest znacznie prostszy w konfiguracji i generuje niewielkie obciążenie sprzętowe.],

  [[4] --- Mount SMB.pcap: Reconstructing file systems and file operations from network traffic \ @hilgert_mount_2024],
  [Network forensics, SMB reconstruction, metadata access, packet extraction],
  [SMB],
  table.cell(colspan: 3)[Artykuł pokazuje, jak niebezpieczne mogą być popularne serwery udostępniające katalogi przez protokół SMB. Wykazano, że z samego zapisanego ruchu sieciowego można odtworzyć pełną strukturę plików ofiary, logi czynności i wszystkie metadane. Jest to istotny dowód na to, w jaki sposób domyślna wygoda w instalacji SMB bez odpowiedniego szyfrowania może całkowicie udostępnić wszystkie dane podpiętej maszyny potencjalnemu podsłuchiwaczowi.]
)

= Conclusions

== SLR process
Proces systematycznego przeglądu literatury pokazał, że dobór słów kluczowych był największym wyzwaniem. Główną przeszkodą była kolizja popularnych akronimów (np. "NFS") ze skrótami używanymi w innych dziedzinach (np. telekomunikacji lub inżynierii antenowej), co wymagało zastosowania licznych wykluczeń w zapytaniach. Dodatkowo zauważono, że automatyczne wyszukiwania w największych bazach często zwracają wiele ogólnych publikacji o bezpieczeństwie pamięci chmurowej (Cloud Storage), co wymusiło dokładną, ręczną filtrację pobranych abstraktów w celu skoncentrowania się na warstwie bezpieczeństwa związanej bezpośrednio z sieciowym udostępnianiem plików.

== SLR results

Wyniki przeglądu literatury dla 12 publikacji wskazują, że w kontekście *małego, lokalnego* i jednocześnie *bezpiecznego* systemu plików (np. domowy NAS / mała sieć firmowa) dominują trzy praktyczne kierunki rozwiązań:

1. *„Bezpieczeństwo w transporcie”* — zabezpieczenie komunikacji przez wbudowane szyfrowanie (np. SMB przez QUIC/TLS) i analiza narzutów wydajnościowych @mitrovic_smb_2025.
2. *Hardening serwera i egzekwowanie polityk* — poprawa wydajności oraz bezpieczeństwa przez mechanizmy kontroli dostępu i filtracji ruchu bliżej jądra systemu (np. eBPF w NFS) @lin_knfs_2024.
3. *Warstwa pośrednia / „osłona”* — transparentne lub półtransparentne warstwy bezpieczeństwa (VFS/minifiltry, bramki pass-through) służące m.in. do DLP i ochrony przed ransomware ,kosztem większego narzutu i złożoności @montano_secure_2022 @mahboubi_file_2024.

Jednocześnie literatura pokazuje, że dla protokołów używanych w sieciach lokalnych (SMB/CIFS) realnym zagrożeniem jest możliwość odtworzenia hierarchii plików i operacji z samego ruchu sieciowego (np. z PCAP), jeśli transmisja nie jest odpowiednio zabezpieczona @hilgert_mount_2024. Wniosek ten bezpośrednio wzmacnia wymaganie „szyfrowanie i integralność w transporcie” jako podstawowy element dla projektu.

= Literature
#bibliography("bib.bib", full: true)
