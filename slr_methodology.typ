#set text(lang: "pl", overhang: true)
#set par(justify: true)
#set heading(numbering: "1.1")

#align(center)[
    #text([Bezpieczny i łatwy w konfiguracji sieciowy system plików], weight: "bold", size: 20pt)
]

#let autor(imie, indeks) = {
    align(center, {
        [*#text(12pt, imie)*]
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

= Goals and questions

*Goal of the SLR*

Celem systematycznego przeglądu literatury jest identyfikacja i porównanie mechanizmów oraz rozwiązań architektonicznych, które pozwalają budować lub wdrażać sieciowe / rozproszone systemy plików o wysokim poziomie bezpieczeństwa przy jednoczesnym zachowaniu prostoty konfiguracji i administracji. Przegląd ma wskazać, jakie podejścia najlepiej równoważą wymagania dotyczące ochrony danych, łatwości zarządzania oraz akceptowalnego narzutu wydajnościowego.

*Initial research questions*

- *RQ1.* Jakie typy sieciowych i rozproszonych systemów plików są najczęściej opisywane w literaturze w kontekście bezpieczeństwa?
- *RQ2.* Jakie mechanizmy bezpieczeństwa są stosowane w tych systemach: szyfrowanie w locie, szyfrowanie spoczynku, uwierzytelnianie, autoryzacja, kontrola dostępu, zarządzanie kluczami, audyt?
- *RQ3.* Jakie rozwiązania architektoniczne wspierają prostą konfigurację i administrację, np. centralizacja polityk, integracja z Kerberosem/LDAP/AD, automatyzacja wdrożeń, przezroczyste szyfrowanie, pośredniki bezpieczeństwa, polityki po stronie klienta lub serwera?
- *RQ4.* Jakie kompromisy są raportowane pomiędzy bezpieczeństwem, wydajnością, skalowalnością i łatwością użycia?
- *RQ5.* Które z rozwiązań zostały zweryfikowane eksperymentalnie lub wdrożone w środowisku rzeczywistym / przemysłowym?

= Keywords

Poniżej zestaw słów kluczowych z synonimami. Warto traktować je jako trzy grupy pojęć: system plików, bezpieczeństwo, prostota konfiguracji/zarządzania.

*A. Network / distributed file systems*
- network file system
- distributed file system
- NFS
- NFSv4
- pNFS
- AFS
- SMB
- CIFS
- GlusterFS
- Samba

*B. Security mechanisms*
- security
- encryption
- cryptograph\*
- authentication
- authorization
- access control
- Kerberos
- TLS

*C. Excluded context terms (do odrzucenia)*
Ze względu na częste kolizje popularnych skrótów (np. "NFS") ze skrótami używanymi w innych dziedzinach nauki (co znacząco utrudniało wyszukiwanie), do zapytania wybrano następujące wymuszone wykluczenia:
- blockchain
- TNFS
- hadoop
- antenna
- 5G
- 6G
- broadband
- UAV
- phishing

== Search strings

Poniżej znajduje się główne zapytanie wyszukujące (search string) zastosowane do przeglądu:

```text
TITLE( "network file system" OR "distributed file system" OR "NFS" OR "NFSv4" OR "pNFS" OR "AFS" OR "SMB" OR "CIFS" OR "GlusterFS" OR "Samba")
AND TITLE-ABS-KEY( "security" OR "encryption" OR "cryptograph*" OR "authentication" OR "authorization" OR "access control" OR "Kerberos" OR "TLS")
AND NOT TITLE-ABS-KEY("blockchain" OR "TNFS" OR "hadoop" OR "antenna" OR "5G" OR "6G" OR "broadband" OR "UAV") 
AND NOT ("phishing")
AND PUBYEAR > 2019
```

== Dostosowanie do baz danych

Powyższe zapytanie stanowiło główny trzon. Zostało ono jednak dostosowane pod względem składni w zależności od wyszukiwarki i bazy danych (Scopus, IEEE Xplore, SpringerLink). Należy zaznaczyć, że ramy czasowe, ograniczające datę publikacji do lat po 2019 roku, były konsekwentnie stosowane we wszystkich bazach (najczęściej wybierano je za pomocą filtrów w interfejsie graficznym podczas wyszukiwania).

== Literature databases

Rekomendowany zestaw baz stanowiły wyłącznie trzy pozycje:
- Scopus
- IEEE Xplore
- SpringerLink

== Inclusion criteria

Do SLR powinny trafić prace spełniające wszystkie lub prawie wszystkie warunki:
- *Rok publikacji*: rok 2020 i nowsze (zapytania "PUBYEAR > 2019"), ponieważ interesują nas nowoczesne architektury bezpieczeństwa i systemy sieciowe używane we współczesnych środowiskach.
- *Język*: angielski.
- *Typ publikacji*: artykuły konferencyjne, artykuły czasopismowe, ewentualnie pełne artykuły warsztatowe; tylko recenzowane publikacje.
- *Zakres tematyczny*: praca musi dotyczyć sieciowego lub rozproszonego systemu plików, protokołu dostępu do plików albo architektury przechowywania plików z dostępem przez sieć.
- *Wymiar bezpieczeństwa*: publikacja musi opisywać przynajmniej jeden konkretny mechanizm związany z bezpieczeństwem, np. szyfrowanie, uwierzytelnianie, autoryzację, kontrolę dostępu, zarządzanie kluczami, poufność, integralność lub audyt.
- *Wymiar administracyjny / użytecznościowy*: publikacja powinna odnosić się do wdrażania, konfiguracji, zarządzania albo złożoności administracyjnej, jeżeli jest to dostępne.
- *Dostępność pełnego tekstu*: pełny tekst musi być dostępny do analizy.
- *Weryfikowalność*: praca powinna zawierać opis architektury, mechanizmu albo wdrożenia na tyle szczegółowy, by dało się z niej wydobyć dane do porównania.

== Exclusion criteria

Wykluczyć należy publikacje, które:
- Nie dotyczą systemów plików sieciowych / rozproszonych lub tylko marginalnie wspominają o nich.
- Dotyczą wyłącznie ogólnego bezpieczeństwa storage / cloud / big data, bez odniesienia do warstwy file system.
- Są o blockchainie, phishingu lub TNFS i nie mają bezpośredniego związku z badanym tematem.
- Nie zawierają konkretnego mechanizmu lub architektury, np. są jedynie ogólną dyskusją koncepcyjną.
- Nie mają wyników empirycznych ani formalnej walidacji, jeśli publikacja nie wnosi wyraźnej, technicznej propozycji.
- Są streszczeniami, posterami, slajdami, notkami redakcyjnymi, książkami, rozdziałami książek, pracami dyplomowymi lub patentami.
- Są duplikatami tej samej pracy z różnych baz — zachować należy najpełniejszą wersję.
- Nie są w języku angielskim.
- Nie są recenzowane lub pochodzą z mało wiarygodnych źródeł bez weryfikacji naukowej.
- Nie zawierają żadnych danych o wpływie rozwiązania na bezpieczeństwo lub administrację.

== Quality criteria

Poniższe kryteria nadają się do oceny jakości publikacji przed ekstrakcją danych. Można je oceniać binarnie (0/1) albo w skali 0–2.

- *Q1. Jasno zdefiniowany problem badawczy i model zagrożeń*: Czy autorzy precyzyjnie opisują, jaki problem bezpieczeństwa rozwiązują i wobec jakiego modelu ataku?
- *Q2. Opis architektury lub mechanizmu jest wystarczająco szczegółowy*: Czy da się odtworzyć główne elementy rozwiązania?
- *Q3. Rozwiązanie zawiera konkretny mechanizm bezpieczeństwa*: Czy praca pokazuje rzeczywiste zabezpieczenie, a nie tylko deklarację „secure”?
- *Q4. Istnieje walidacja eksperymentalna lub formalna*: Czy autorzy przedstawili eksperymenty, testbed, prototyp, symulację albo formalny dowód / analizę?
- *Q5. Zakres testów jest adekwatny*: Czy użyto realistycznego środowiska, sensownego obciążenia, liczby węzłów, użytkowników albo danych?
- *Q6. Porównanie z istniejącymi rozwiązaniami*: Czy praca porównuje się z baseline’em, innym protokołem, inną polityką dostępu lub wcześniejszym podejściem?
- *Q7. Uwzględnienie kosztu administracyjnego / użytecznościowego*: Czy autorzy analizują prostotę konfiguracji, liczbę kroków wdrożenia, automatyzację, integrację z IAM albo złożoność zarządzania?
- *Q8. Omówienie ograniczeń*: Czy praca otwarcie opisuje ograniczenia, koszty, ryzyka i warunki użycia?

_Przykładowa reguła kwalifikacji:_ publikacja przechodzi do ekstrakcji danych, jeśli spełnia co najmniej 5 z 8 kryteriów, przy czym obowiązkowe są Q1, Q2 i Q4 albo Q3.

=== Data extraction

Z każdej zakwalifikowanej publikacji warto wyciągnąć następujące dane:

*A. Metadane*
- autorzy,
- rok,
- tytuł,
- typ publikacji,
- konferencja / czasopismo,
- DOI / link.

*B. Charakterystyka systemu*
- nazwa systemu plików lub protokołu,
- rodzaj systemu: NFS, SMB/CIFS, AFS, Lustre, CephFS, GlusterFS, GPFS, BeeGFS itd.,
- architektura: klient-serwer, rozproszona, hybrydowa, proxy/middlebox, federacyjna, P2P, chmurowa,
- środowisko: enterprise, cloud, HPC, IoT, grid, research, industrial.

*C. Mechanizmy bezpieczeństwa*
- szyfrowanie w locie,
- szyfrowanie spoczynku,
- uwierzytelnianie,
- autoryzacja,
- kontrola dostępu,
- model tożsamości,
- zarządzanie kluczami,
- integralność danych,
- poufność,
- audyt / logging,
- wykrywanie nadużyć / odporność na DoS.

*D. Prostota konfiguracji i administracji*
- liczba wymaganych komponentów,
- sposób wdrożenia,
- poziom automatyzacji,
- integracja z istniejącą infrastrukturą (LDAP, AD, Kerberos, PKI),
- liczba kroków konfiguracyjnych,
- czy rozwiązanie jest transparentne dla użytkownika,
- czy wymaga zmian po stronie klienta, serSerwera czy obu.

*E. Ewaluacja*
- typ ewaluacji: prototyp, eksperyment, testbed, symulacja, analiza formalna, wdrożenie,
- liczba węzłów / użytkowników / hostów / datasetów,
- scenariusz testowy,
- benchmarki,
- metryki bezpieczeństwa,
- metryki wydajności: opóźnienie, przepustowość, narzut CPU, narzut sieci, czas logowania, koszt operacji plikowych,
- metryki użyteczności / administracji, jeśli występują.

*F. Wyniki i wnioski*
- główne zalety,
- główne ograniczenia,
- trade-off między bezpieczeństwem a prostotą,
- gotowość do wdrożenia produkcyjnego,
- poziom dojrzałości rozwiązania.

*G. Kwalifikacja do syntezy*
- czy praca odpowiada na RQ1–RQ5,
- czy nadaje się do porównania z innymi rozwiązaniami,
- czy zawiera dane unikalne, czy tylko potwierdza znane podejście.

== SLR process

+ *Planowanie* \
  Wszyscy członkowie wspólnie ustalili pytania oraz cele ekstrakcji.
+ *Wybór baz artykułów* \
  Wybrane zostały Scopus, IEEE Xplore oraz SpringerLink.
+ *Doprecyzowanie zapytań wyszukiwawczych*
+ *Walidacja i dostosowanie kryteriów włączenia*
+ *Surowe wyniki wyszukiwania* \
  Z wybranych baz pobrane zostały wyniki wyszukiwania (liczby podane w dalszych sekcjach z wynikami).
+ *Usuwanie duplikatów* \
  Zastosowany został program Zotero.
+ *Selekcja na podstawie tytułu i streszczenia artykułu* \
  Zastosowany został program Zotero.
+ *Selekcja na podstawie pełnego tekstu* \
  Artykuły zostały rozdzielone pomiędzy członków zespołu do szczegółowej lektury. Każda pozycja została zweryfikowana pod kątem merytorycznej zgodności z pytaniami badawczymi oraz spełnienia kryteriów jakości (QA). Każdy wybrany artykuł był dodatkowo weryfikowany przez innego członka zespołu.
+ *Ekstrakcja danych badawczych i synteza* \
  Z każdego zaakceptowanego artykułu wydobyto kluczowe informacje dotyczące: zaproponowanej architektury, mechanizmów bezpieczeństwa, łatwości administracji i wdrożenia oraz głównych wniosków na temat kompromisów z wydajnością. Dane te zostały ujednolicone i zestawione w tabelach, co pozwoliło na przeprowadzenie syntezy jakościowej i wyciągnięcie wniosków dotyczących aktualnego stanu wiedzy w obszarze bezpiecznych, ale prostych w zarządzeniu sieciowych systemów plików.
+ *Raportowanie*

== Wyniki wyszukiwania (Search Results)

Wstępne przeszukiwanie baz danych (zgodnie z przyjętą strategią) przyniosło łącznie *306* rezultatów:
- *Scopus*: 20 publikacji
- *IEEE Xplore*: 127 publikacji
- *SpringerLink*: 159 publikacji

Wyniki te zostaną poddane deduplikacji oraz dalszej selekcji zgodnie z kryteriami włączenia i wykluczenia.

== Wyniki selekcji pilotażowej (Pilot Screening)

Na podstawie ręcznie wyselekcjonowanego zbioru wynikowego z pliku `bib.bib` (12 pozycji) przeprowadzono pilotażową weryfikację. Na obecnym etapie prac *wszystkie 12 ręcznie wyszukanych i wprowadzonych artykułów zostało tymczasowo zaakceptowanych* do pełnej analizy (ewentualne odrzucenia i lista prac wykluczonych zostaną uzupełnione weryfikacją w kolejnych krokach).

*Prace zakwalifikowane do ekstrakcji (Included):*
- @mahboubi_file_2024 _("File System Shield (FSS): A Pass-Through Strategy...")_
- @lin_knfs_2024 _("KNFS: A High-Performance, Security-Enhanced NFS...")_
- @montano_secure_2022 _("Secure File Systems for the Development of a DLP...")_
- @di_girolamo_building_2022 _("Building Blocks for Network-Accelerated Distributed File Systems")_
- @yanakieva_access_2021 _("Access control conflict resolution in distributed file systems...")_
- @ciucanu_samba_2023 _("SAMBA: A Generic Framework for Secure Federated Multi-Armed Bandits")_
- @madana_mitigating_2021 _("Mitigating Storage Challenges through Configuring NAS...")_
- @tiwari_strengthening_2024 _("Strengthening Information Relay by Using a Robust IEP...")_
- @hilgert_mount_2024 _("Mount SMB.pcap: Reconstructing file systems...")_
- @mitrovic_smb_2025 _("SMB Over QUIC: A Performance Evaluation")_
- @cho_arkfs_2023 _("ArkFS: A Distributed File System on Object Storage...")_
- @xu_practical_2022 _("Practical optimizations for lightweight distributed file system...")_

#pagebreak(weak: true)
#bibliography("bib.bib", full: true)