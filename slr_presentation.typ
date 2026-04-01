#set page(paper: "presentation-16-9", margin: 2em)
#set text(size: 22pt)

// Prosty szablon slajdu bez zewnętrznych pakietów
#let slide(title, body) = {
  page[
    // Nagłówek
    #grid(
      columns: (1fr),
      rows: (auto, auto),
      gutter: 1em,
      [#text(size: 32pt, weight: "bold", fill: rgb("004488"))[#title]],
      [#line(length: 100%, stroke: 2pt + rgb("004488"))]
    )
    #v(1em)
    // Ciało slajdu
    #block(width: 100%, body)
  ]
}

// Slajd Tytułowy
#page[
  #align(center + horizon)[
    #text(size: 40pt, weight: "bold", fill: rgb("004488"))[Systematyczny Przegląd Literatury (SLR)]
    #v(1.5em)
    #text(size: 28pt)[Sieciowe i rozproszone systemy plików:\ Bezpieczeństwo vs Prostota administracyjna]
    #v(2em)
    #text(size: 20pt)[Założenia metodologiczne]
  ]
]

#slide("1. Cel Przeglądu (Goal)")[
  Identyfikacja i porównanie mechanizmów oraz rozwiązań architektonicznych dla sieciowych / rozproszonych systemów plików, które:
  
  #v(1em)
  - Zapewniają *wysoki poziom bezpieczeństwa* (ochrona danych).
  - Zachowują *prostotę konfiguracji i administracji*.
  - Utrzymują akceptowalny narzut wydajnościowy.
]

#slide("2. Pytania Badawcze (Research Questions)")[
  #set text(size: 20pt)
  - *RQ1.* Typy systemów najczęściej opisywane w literaturze?
  - *RQ2.* Stosowane mechanizmy bezpieczeństwa (szyfrowanie, ACL, audyt...)?
  - *RQ3.* Rozwiązania architektoniczne wspierające prostotę zarzadzania?
  - *RQ4.* Kompromisy (trade-offs) między bezpieczeństwem, wydajnością a użytecznością?
  - *RQ5.* Które rozwiązania zweryfikowano eksperymentalnie / wdrożono?
  - *RQ6.* Jakie luki badawcze pozostają otwarte?
]

#slide("3. Słowa Kluczowe")[
  Podzielone na trzy kluczowe domeny badawcze:

  #v(1em)
  + *Domena Systemów:*
    network file system, distributed file system, NFS, SMB, Lustre, CephFS...
  + *Domena Bezpieczeństwa:*
    security, encryption, access control, authentication, Kerberos, TLS...
  + *Domena Prostoty i Administracji:*
    usability, easy to use, simple configuration, automation, low overhead...
]

#slide("4. Strategia Wyszukiwania")[
  *Struktura Zapytania:*
  `(Domena Systemów) AND (Domena Bezpieczeństwa)` 

  *Opcjonalne rozszerzenie:* 
  `AND (Domena Prostoty)` dla bardziej zawężonych wyników.

  #v(1em)
  *Główne Bazy Danych:*
  - Scopus
  - Web of Science
  - IEEE Xplore
  - ACM Digital Library
]

#slide("5. Kryteria Włączenia (Inclusion)")[
  Praca musi spełniać warunki:
  
  - *Rok publikacji:* >= 2000 r.
  - *Język i Dostępność:* Angielski, pełen tekst dostępny, recenzowane.
  - *Zakres:* Dotyczy warstwy protokołu/systemu plików (nie ogólnego storage).
  - *Bezpieczeństwo:* Opisuje konkretny mechanizm polityk/ochrony.
  - *Weryfikowalność:* Wystarczająco szczegółowy opis architektury.
]

#slide("6. Kryteria Wykluczenia (Exclusion)")[
  Odfiltrowujemy prace, które:
  
  - Marginesowo wspominają DFS, skupiając się na Big Data / Cloud na wyższych warstwach.
  - Dotyczą technologii pobocznych (np. Blockchain, Phishing).
  - Są ogólnymi dyskusjami braku dowodów testowych/implementacji.
  - Są nierecenzowanymi materiałami, streszczeniami, posterami.
]

#slide("7. Pytania Jakościowe (Quality Criteria)")[
  #set text(size: 19pt)
  Publikacja powinna spełniać m.in.:
  - _Q1._ Jasno zdefiniowany model zagrożeń?
  - _Q2._ Architektura na tyle jasna, że można ją odtworzyć?
  - _Q4/Q5._ Istnieje walidacja eksperymentalna / realistyczne środowisko testowe?
  - _Q7._ Czy uwzględniono aspekty związane z zarządzaniem lub prostotą?
  
  #line(length: 100%, stroke: 1pt + gray)
  _Zasada:_ Decyzja o włączeniu następuje przy spełnieniu np. $5 / 8$ wskazanych progów.
]

#slide("8. Ekstrakcja Danych (Data Extraction)")[
  Z wytypowanych prac wydobywamy:
  - metadane (rok, autorzy, źródło)
  - architekturę i środowisko badane (IoT, HPC, Enterprise)
  - wdrożone mechanizmy bezpieczeństwa (TLS, LDAP)
  - parametry użyteczności (automatyzacja, narzut konfiguracji)
  - wyniki i wnioski eksperymentalne
]

#slide("9. Pilotażowa Ocena Zbioru (Pilot Screening)")[
  #set text(size: 19pt)
  Uruchomiono pilotaż procedury na bazie 9 stanowisk z lokalnego repozytorium (`NFS.bib`).
  
  *WŁĄCZONE DO EKSTRAKCJI (Included):*
  - _"Implementation of a Secured Scalable File Server System"_ (Abukari, 2024) -- opisana kompletna architektura sieciowa uwzględniająca uprawnienia.
  - _"Cryptographic access control in a DFS"_ (Harrington, 2003) -- walidacja użyteczności podziałów kompetencyjnych opartych na kryptografii.
  - _"Understanding Network File Systems (NFS)..."_ (Durvasulu, 2025) -- kompleksowy opis mechanizmów wsparcia.

  *ODRZUCONE Z POWODU (Excluded):*
  - _FileScale..._ (Liao, 2023) oraz _Workload-Driven Perspectives..._ (Singh, 2025) --- brak sekcji skupiającej się na cyberbezpieczeństwie. Wielość pomiarów I/O, brak audytów, czy zarządzania tożsamością.
  - _The Design of a Cryptography Based Secure File System_ (Gudes, 1980) --- brak spełnienia kryterium zakresu daty (rok publ. < 2000 r.).
  - Publikacje Kumar oraz Chatterjee --- zbyt ogólny zarys bezpieczeństwa lub całkowity rozmiar badawczy rzucony w konteksty wydajności SMB/Raspberry.
]

#page[
  #align(center + horizon)[
    #text(size: 40pt, weight: "bold", fill: rgb("004488"))[Dziękuję za uwagę]
    #v(1em)
    #text(size: 24pt)[Przystępujemy do ekstrakcji i weryfikacji zebranego eksportu.]
  ]
]
