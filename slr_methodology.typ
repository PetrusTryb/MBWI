#set heading(numbering: "1.1.")

== Goals and questions

*Goal of the SLR*

Celem systematycznego przeglądu literatury jest identyfikacja i porównanie mechanizmów oraz rozwiązań architektonicznych, które pozwalają budować lub wdrażać sieciowe / rozproszone systemy plików o wysokim poziomie bezpieczeństwa przy jednoczesnym zachowaniu prostoty konfiguracji i administracji. Przegląd ma wskazać, jakie podejścia najlepiej równoważą wymagania dotyczące ochrony danych, łatwości zarządzania oraz akceptowalnego narzutu wydajnościowego.

*Initial research questions*

- *RQ1.* Jakie typy sieciowych i rozproszonych systemów plików są najczęściej opisywane w literaturze w kontekście bezpieczeństwa?
- *RQ2.* Jakie mechanizmy bezpieczeństwa są stosowane w tych systemach: szyfrowanie w locie, szyfrowanie spoczynku, uwierzytelnianie, autoryzacja, kontrola dostępu, zarządzanie kluczami, audyt?
- *RQ3.* Jakie rozwiązania architektoniczne wspierają prostą konfigurację i administrację, np. centralizacja polityk, integracja z Kerberosem/LDAP/AD, automatyzacja wdrożeń, przezroczyste szyfrowanie, pośredniki bezpieczeństwa, polityki po stronie klienta lub serwera?
- *RQ4.* Jakie kompromisy są raportowane pomiędzy bezpieczeństwem, wydajnością, skalowalnością i łatwością użycia?
- *RQ5.* Które z rozwiązań zostały zweryfikowane eksperymentalnie lub wdrożone w środowisku rzeczywistym / przemysłowym?
- *RQ6.* Jakie luki badawcze pozostają otwarte w obszarze bezpiecznych, ale prostych w administracji systemów plików sieciowych?

== Keywords

Poniżej zestaw słów kluczowych z synonimami. Warto traktować je jako trzy grupy pojęć: system plików, bezpieczeństwo, prostota konfiguracji/zarządzania.

*A. Network / distributed file systems*
- network file system
- distributed file system
- networked file system
- file sharing system
- network storage
- parallel file system
- NAS
- DFS
- NFS, NFSv4, pNFS
- AFS
- SMB, CIFS, Samba
- Lustre
- CephFS
- GlusterFS
- GPFS / IBM Spectrum Scale
- BeeGFS
- MooseFS
- SeaweedFS

*B. Security mechanisms*
- security
- secure / security architecture
- encryption
- cryptograph\*
- confidentiality
- integrity
- authentication
- authorization
- access control
- ACL
- Kerberos
- TLS
- SSL
- key management
- secure channel
- auditing
- policy enforcement
- identity management

*C. Simplicity / administration / usability*
- usability
- easy to use
- ease of use
- simple configuration
- configuration
- management
- administration
- deploy\*
- automation
- maintainability
- low overhead
- low entry barrier
- transparent security
- centralized management

== Search strings

Proponuję rozdzielić wyszukiwanie na rdzeń i wariant uzupełniający.

*Fragment 1 — domena*
```text
("network file system" OR "distributed file system" OR "networked file system" OR "network storage" OR "parallel file system" OR "file sharing system" OR NFS OR NFSv4 OR pNFS OR AFS OR SMB OR CIFS OR Samba OR Lustre OR CephFS OR GlusterFS OR GPFS OR "IBM Spectrum Scale" OR BeeGFS OR MooseFS OR SeaweedFS)
```

*Fragment 2 — bezpieczeństwo*
```text
(security OR secure OR encryption OR cryptograph* OR confidentiality OR integrity OR authentication OR authorization OR "access control" OR ACL OR Kerberos OR TLS OR SSL OR "key management" OR auditing OR "policy enforcement")
```

*Fragment 3 — prostota konfiguracji i administracji*
```text
(usability OR "ease of use" OR "easy to use" OR "simple configuration" OR configuration OR administration OR management OR automation OR maintainability OR deploy* OR "low overhead" OR "low entry barrier")
```

*Final search string — wersja główna*
Najbezpieczniej użyć w głównym wyszukiwaniu:
```text
(Fragment 1) AND (Fragment 2)
```

*Final search string — wersja rozszerzona*
Jeśli chcesz mocniej celować w temat prostoty zarządzania:
```text
(Fragment 1) AND (Fragment 2) AND (Fragment 3 OR "transparent security" OR "centralized management")
```

*Dodatkowe wykluczenia*
```text
NOT blockchain
NOT phishing
NOT TNFS
```

=== Dostosowanie do baz danych

*Scopus / Elsevier*
```text
TITLE-ABS-KEY((Fragment 1) AND (Fragment 2))
AND NOT TITLE-ABS-KEY(blockchain OR phishing OR TNFS)
```

*Web of Science*
```text
TS=((Fragment 1) AND (Fragment 2))
NOT TS=(blockchain OR phishing OR TNFS)
```

*IEEE Xplore*
```text
(("All Metadata":Fragment 1) AND ("All Metadata":Fragment 2))
NOT ("All Metadata":blockchain OR "All Metadata":phishing OR "All Metadata":TNFS)
```

*ACM Digital Library*
```text
(Title:Fragment 1 OR Abstract:Fragment 1)
AND (Title:Fragment 2 OR Abstract:Fragment 2)
AND NOT (Title:blockchain OR Abstract:blockchain OR Title:phishing OR Abstract:phishing)
```

*SpringerLink / Wiley / inne wyszukiwarki pełnotekstowe*
- skrócić zapytanie do najważniejszych nazw systemów i najważniejszych mechanizmów bezpieczeństwa,
- stosować cudzysłowy dla wyrażeń wielowyrazowych,
- ograniczyć wyniki do Computer Science / Engineering / Security, jeśli baza pozwala.

W praktyce dobrze działa podejście dwustopniowe:
1. szerokie wyszukiwanie bezpieczeństwa,
2. ręczne odfiltrowanie prac, które nie dotyczą realnych sieciowych systemów plików albo nie opisują mechanizmu/architektury.

== Literature databases

Rekomendowany zestaw baz:
- Scopus
- Web of Science Core Collection
- IEEE Xplore
- ACM Digital Library
- ScienceDirect (Elsevier)
- SpringerLink

Opcjonalnie jako uzupełnienie:
- Wiley Online Library

Dodatkowo można zastosować:
- snowballing wsteczny i w przód z wybranych prac,
- przegląd cytowań w pracach przeglądowych,
- ręczne sprawdzenie najbardziej relewantnych konferencji i czasopism z obszaru systems / security / distributed storage.

== Inclusion criteria

Do SLR powinny trafić prace spełniające wszystkie lub prawie wszystkie warunki:
- *Rok publikacji*: najlepiej od 2000 r. wzwyż, ponieważ interesują nas nowoczesne architektury bezpieczeństwa i systemy sieciowe używane we współczesnych środowiskach.
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

== Data extraction

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
- czy praca odpowiada na RQ1–RQ6,
- czy nadaje się do porównania z innymi rozwiązaniami,
- czy zawiera dane unikalne, czy tylko potwierdza znane podejście.