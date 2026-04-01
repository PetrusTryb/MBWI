#import "@preview/touying:0.5.3": *
#import themes.simple: *

#set text(lang: "pl")

#show: simple-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Bezpieczny i łatwy w konfiguracji sieciowy system plików],
    subtitle: [Raport z Systematycznego Przeglądu Literatury (SLR)],
    author: [Mikołaj Klikowicz (193264) \ Aleksander Iwicki (199354) \ Piotr Trybisz (193557) \ Wiktor Gawroński (193285)],
    date: datetime.today().display("[day].[month].[year]"),
  ),
)

#title-slide[]

== Cel Projektu
Tematem projektu jest: Bezpieczny i łatwy w konfiguracji sieciowy system plików

Celem SLR jest zidentyfikowanie istniejących mechanizmów bezpieczeństwa stosowanych w sieciowych i rozproszonych systemach plików, z naciskiem na rozwiązania, które są zarówno skuteczne, jak i łatwe do wdrożenia, przy jednoczesnym zachowaniu wydajności.


== Pytania Badawcze (RQ)
- *RQ1.* Jakie typy sieciowych i rozproszonych systemów plików są najczęściej opisywane w literaturze w kontekście bezpieczeństwa
- *RQ2.* Jakie mechanizmy bezpieczeństwa są stosowane
- *RQ3.* Jakie rozwiązania architektoniczne wspierają prostą konfigurację
- *RQ4.* Jakie kompromisy występują między bezpieczeństwem a użytecznością
- *RQ5.* Które z rozwiązań wdrożono w środowisku przemysłowym lub zweryfikowano eksperymentalnie

== Metodologia SLR - Przeszukiwanie Bazy
*Wykorzystane bazy danych literaturowych:*
- Scopus
- IEEE Xplore
- SpringerLink

*Główne słowa kluczowe:* \
NFS, pNFS, SMB, CIFS, GlusterFS, Samba, security, encryption, authentication.

*Wykluczenia (eliminacja szumu ze skrótów):* \
blockchain, hadoop, antenna, 5G, 6G. Publikacje z lat 2020+.

== Kryteria Selekcji
*Włączenie (Inclusion):*
- Rok 2020+, język angielski.
- Recenzowane artykuły zgłębiające mechanizmy bezpieczeństwa (np. audyt, schemat szyfrowania) w sieciowych systemach.

*Wykluczenie (Exclusion):*
- Omijanie warstwy systemów plików (np. ogólne "cloud storage").
- Pomyłkowe wyszukania wieloznacznych inicjałów z telekomunikacji.
- Teoretyczne koncepcje bez ewaluacji.

== Proces SLR
1. Planowanie (określenie RQ).
2. Wybór baz i przygotowanie zapytań wyszukiwawczych
3. Pozyskanie wyników i zdefiniowanie kryteriów selekcji
4. Usuwanie duplikatów narzędziem Zotero.
5. Wstępna selekcja (tytuł, abstrakt).
6. Selekcja pełnych tekstów oraz weryfikacja Kryteriów Jakości (QA)
7. Ekstrakcja danych

== Kryteria Jakości (QA)
- *QA1.* Czy praca zawiera wyniki empiryczne (a nie wyłącznie koncepcję/rozważania teoretyczne)?
- *QA2.* Czy jasno określono cel bezpieczeństwa i/lub model zagrożeń (np. podsłuch w LAN, ransomware, nadużycia uprawnień)?
- *QA3.* Czy opisano badany system/protokół oraz scenariusz wdrożeniowy (SMB/NFS/DFS, LAN/NAS vs chmura/HPC)?
- *QA4.* Czy mechanizm bezpieczeństwa jest opisany na tyle szczegółowo, aby móc ocenić trudność i koszty wdrożenia/utrzymania?
- *QA5.* Czy ewaluacja jest odpowiednia (punkt odniesienia + metryki przepustowości/opóźnień/narzutu dla operacji plikowych)?
- *QA6.* Czy omówiono kompromisy bezpieczeństwo - wydajność - użyteczność oraz aspekty administracyjne (konfiguracja, kompatybilność)?
- *QA7.* Czy procedura i środowisko testowe są opisane na tyle, aby zapewnić powtarzalność?
- *QA8.* Czy wskazano ograniczenia oraz zagrożenia dla trafności wyników?
== SLR - Wyniki W Liczbach
Przed usunięciem duplikatów i selekcją zebrano artykuły w następujących ilościach:

- *Scopus:* 20 publikacji
- *IEEE Xplore:* 127 publikacji
- *SpringerLink:* 159 publikacji

Wstępnie z tego wybrano 12 publikacji.

== Kluczowe Wnioski z Ekstrakcji Danych (I)
*Protokół SMB i jego wady/zalety:*
- Zastosowanie SMB przez protokół QUIC i TLS rozwiązuje problemy bezpieczeństwa transportu, zachowując kompromis w zakresie wydajności.
- Wykazano poważne skutki braku szyfrowania w tradycyjnym SMB (możliwość odtworzenia całej struktury katalogów na podstawie przechwyconego ruchu sieciowego, np. pcap).

== Kluczowe Wnioski z Ekstrakcji Danych (II)

- Możliwe jest tworzenie lekkiego, elastycznego bezpieczeństwa (z rezygnacją z rygoru POSIX) dedykowanego dla mniejszych urządzeń (np. tanie NASy) dla małych firm.
- Użycie eBPF może w prosty sposób zwiększyć wydajność mechanizmów bezpieczeństwa.

== Wnioski Końcowe - Kierunki Rozwoju (I)
Bezpieczny lokalny system plików powinien skupiać się na 3 wymiarach:

1. *Bezpieczeństwo w transporcie* - komunikacja przez wbudowane szyfrowanie bez nadmiernej komplikacji, jak w przypadku VPN (np. SMB over QUIC).
2. *Hardening serwera (polityki)* - nowoczesne podejście (np. eBPF) zamiast np. FUSE.

== Wnioski Końcowe - Kierunki Rozwoju (II)

3. *Warstwy pośrednie* - VFS/minifiltry służące np. do ochrony przed atakami ransomware, dające dodatkową barierę kosztem niewielkiego narzutu.

== Dziękujemy za uwagę
#align(center)[
  \ \ \ \ \ \ \ \ \ 
  *Bezpieczny i łatwy w konfiguracji sieciowy system plików*
  
  #v(2em)
  Pytania?
]
