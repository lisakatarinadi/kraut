-- 1. Auswahl eines Rezeptes nach Rezeptname: 
select * from krautundrueben.rezept where NAME = "Rezeptname";

-- 2. Auswahl aller Rezepte einer bestimmten Ernährungskategorie
select * from krautundrueben.rezept inner join rezeptkat r on rezept.r_id = r.rezept inner join kategorie k on k.KAT_ID = r.kategorie where KAT_NAME = "Ernährungskategorie";

-- 3. Auswahl aller Rezepte, die eine gewisse Zutat enthalten
select * from krautundrueben.rezept inner join rezeptzutat r on rezept.r_id = r.r_id inner join zutat z on r.z_id = z.ZUTATENNR where BEZEICHNUNG = "Zutat";

-- 4. Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden
select k.KUNDENNR, VORNAME, NACHNAME, AVG(z.KALORIEN), AVG(z.PROTEIN), AVG(z.KOHLENHYDRATE)
from bestellung
         inner join kunde k on bestellung.KUNDENNR = k.KUNDENNR
         inner join bestellungzutat b on bestellung.BESTELLNR = b.BESTELLNR
         inner join zutat z on b.ZUTATENNR = z.ZUTATENNR
group by k.KUNDENNR;

-- 5. Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind
select *
from zutat
         left join rezeptzutat r on r.z_id = zutat.ZUTATENNR
         left join rezept r2 on r2.r_id = r.r_id
where NAME is NULL;

-- 6. Auswahl aller Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten
select * from rezept where r_kcal <= Kalorienmenge;

-- 7. Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten
select rezept.NAME, COUNT(rezept.NAME) as "Anzahl der Zutaten"
from rezept
         right join rezeptzutat r on rezept.r_id = r.r_id
group by r.r_id
HAVING COUNT(rezept.NAME) < 5 

-- 8. Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten und eine bestimmte Ernährungskategorie erfüllen
select rezept.NAME, COUNT(rezept.NAME) as "Anzahl der Zutaten", KAT_NAME
from rezept
         inner join rezeptzutat r on rezept.r_id = r.r_id
        inner join rezeptkat r2 on rezept.r_id = r2.rezept
        inner join kategorie k on r2.kategorie = k.KAT_ID
group by r.r_id, KAT_NAME
HAVING COUNT(rezept.NAME) < 5 and KAT_NAME = "Vegetarisch";

-- 9. Free Style 1: Die Rezepte mit der Teuerten Zutat
select *
from rezept
         inner join rezeptzutat r on rezept.r_id = r.r_id
        inner join zutat z on r.z_id = z.ZUTATENNR
where NETTOPREIS = (select MAX(NETTOPREIS) from zutat)

-- 10. Free Style 2: Auswahl aller Zutaten ohne Lieferant
select * FROM zutat left join lieferant l on l.LIEFERANTENNR = zutat.LIEFERANT where LIEFERANTENNR is NULL;

-- 11. Free Style 3: Der Kunde mit der höchsten Rechnung
select k.VORNAME, k.NACHNAME , RECHNUNGSBETRAG
from bestellung
         right join kunde k on k.KUNDENNR = bestellung.KUNDENNR
where RECHNUNGSBETRAG = (select MAX(RECHNUNGSBETRAG) from bestellung)


