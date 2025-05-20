Feature: Zakup produktu w sklepie internetowym

    Background:
        Given użytkownik jest na stronie głównej "Mojego Ulubionego Sklepu"
        And użytkownik wyszukuje produkt o nazwie "Klocki Lego 120 el."
        And wybiera pierwszy produkt z listy wyników
        And dodaje produkt do koszyka
        And przechodzi do strony koszyka
        And potwierdza zawartość koszyka

    Scenario: Pomyślny zakup produktu z logowaniem i płatnością kartą
        When przechodzi do strony logowania
        And podaje poprawne dane logowania
        And przechodzi do strony z adresem dostawy
        And wybiera istniejący adres dostawy
        And przechodzi do strony z metodą płatności
        And wybiera metodę płatności "Karta Kredytowa"
        And podaje dane karty kredytowej
        And akceptuje regulamin
        And klika przycisk "Złóż Zamówienie"
        Then użytkownik powinien zobaczyć potwierdzenie zamówienia z numerem zamówienia
        And status zamówienia powinien być "W trakcie realizacji"
        And w historii zamówień użytkownika powinien pojawić się zakupiony produkt "Klocki Lego 120 el."

    Scenario: Pomyślny zakup produktu jako gość (bez logowania)
        When przechodzi do strony z adresem dostawy jako gość
        And podaje nowy adres dostawy
        And przechodzi do strony z metodą płatności
        And wybiera metodę płatności "Szybki Przelew"
        And akceptuje regulamin
        And klika przycisk "Złóż Zamówienie"
        Then użytkownik powinien zobaczyć potwierdzenie zamówienia z numerem zamówienia
        And status zamówienia powinien być "W trakcie realizacji"
        And w historii zamówień użytkownika (lub mailu) powinien pojawić się zakupiony produkt "Klocki Lego 120 el."
