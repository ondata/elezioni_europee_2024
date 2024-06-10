<a href="https://ondata.it/dona/"><img src="https://img.shields.io/badge/%F0%9F%92%AA-Sostienici-success"/></a> <a href="https://ondata.it/"><img src="https://img.shields.io/badge/by-onData-%232e85d1"/></a> <a href="https://ondata.substack.com/"> <img src="https://img.shields.io/badge/%E2%9C%89%EF%B8%8F-Newsletter-%23cc3232" alt="✉️ Newsletter">
</a>

# Elezioni europee 2024: scrutini voti Italia

## Premessa

Il DAIT - Ministero dell'Interno Direzione Centrale per i Servizi Elettorali - S.I.E.C.C. [pubblica su Eligendo](https://elezioni.interno.gov.it/europee/scrutini/20240609/scrutiniEI) i dati elettorali **non in modalità leggibile meccanicamente**, in contrasto a come previsto da normativa e linee guida correnti.

Dopo un po' di tempo verranno pubblicati i dati in formato aperto e leggibile meccanicamente. Ma sarebbe da fare subito, abilitando sia il *download* in blocco, che quello via *API* documentate, inserendo le dovute note del caso sulla eventuale momentanea incompletezza e/o ufficialità dei dati.

Per questo ne abbiamo estratti alcuni, trasformati e resi disponibili in formato aperto e leggibile meccanicamente.

## Dati

Sono estratti con lo schema disponibile su Eligendo. Ai campi originali ne sono stati aggiunti alcuni, utili per essere utilizzati al meglio.

Download:

- [**`insieme.csv`**](data/insieme.csv) - dati elettorali anagrafici di ogni Comune;
- [**`liste.csv`**](data/liste.csv) - dati elettorali delle liste per ogni Comune.

**NOTA BENE**:

- mancano alcune sezioni, circa lo 0.4 delle sezioni;
- sono stati estratti circa alle ore 12:00 del 10 giugno 2024;
- potrebbe esserci qualche errore, per favore segnalatecelo a info@ondata.it.

Sei libero di usare questi dati come vuoi, ma ti chiediamo di citare la fonte e di inserire il link a questa pagina (ad esempio "Fonte dati: associazione onData").

### Insieme

Questo primo dataset - [**`insieme.csv`**](data/insieme.csv) - contiene i dati elettorali anagrafici di ogni Comune (numero di elettori, di sezioni, ecc.).

Ai dati originali sono stati aggiunti i campi `DESCRIZIONE COMUNE`, `SIGLA`, `CODICE ELETTORALE`, `CODICE ISTAT`, `CODICE BELFIORE`. Il campo più importante è `CODICE ISTAT`, perché consente di collegare i dati con quelli di altre fonti e realizzare grafici e mappe interattive.<br>
La fonte utile per aggiungere ai codici elettorali di Eligendo, i codici comunali Istat, è sempre il DAIT e la "[Tabella di conversione codici dei comuni italiani](https://dait.interno.gov.it/territorio-e-autonomie-locali/sut/open_data/elenco_codici_comuni_csv.php)".

Il campo `join`, deriva dalla normalizzazione del campo `cod_prov` e `cod_com` per poter fare il join la tabella appena citata.

| join | codice | st | t_ele | f_elet | dt_ele | l_terr | area | cod_com | desc_com | cod_prov | desc_prov | ele_m | ele_f | ele_t | vot_m | vot_f | vot_t | perc_vot | sz_perv | sz_tot | fine_rip | sk_bianche | sk_nulle | sk_contestate | tot_vot_lis | non_valid | dt_agg | data_prec_elez | circ_sto | reg_sto | prov_sto | comu_sto | tipo_tras | NR. | DESCRIZIONE COMUNE | SIGLA | CODICE ELETTORALE | CODICE ISTAT | CODICE BELFIORE |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 0670590 | 4180670590 | ESERCIZIO | Europee | SCRUTINI | 20240609000000 | COMUNE | I | 590 | PLACANICA | 67 | REGGIO CALABRIA | 591 | 589 | 1180 | 143 | 125 | 268 | 22,71 | 3 | 3 | N | 4 | 6 | 0 | 258 | null | 20240610054042 | 20190526000000 | 4 | 18 | 67 | 590 | CO | 5174 | PLACANICA | RC | 3180670590 | 080059 | G729 |
| 0150410 | 1030150410 | ESERCIZIO | Europee | SCRUTINI | 20240609000000 | COMUNE | I | 410 | CASTREZZATO | 15 | BRESCIA | 2826 | 2804 | 5630 | 1680 | 1703 | 3383 | 60,09 | 5 | 5 | N | 97 | 97 | 0 | 3189 | null | 20240610044907 | 20190526000000 | 1 | 3 | 15 | 410 | CO | 1786 | CASTREZZATO | BS | 1030150410 | 017045 | C332 |
| 0380820 | 4130380820 | ESERCIZIO | Europee | SCRUTINI | 20240609000000 | COMUNE | I | 820 | ROCCA DI MEZZO | 38 | L'AQUILA | 860 | 809 | 1669 | 478 | 423 | 901 | 53,98 | 4 | 4 | N | 34 | 31 | 0 | 836 | null | 20240610045622 | 20190526000000 | 4 | 13 | 38 | 820 | SZ | 5675 | ROCCA DI MEZZO | AQ | 3130380820 | 066082 | H402 |
| 0510050 | 4150510050 | ESERCIZIO | Europee | SCRUTINI | 20240609000000 | COMUNE | I | 50 | ARZANO | 51 | NAPOLI | 12483 | 13751 | 26234 | 4818 | 4776 | 9594 | 36,57 | 32 | 32 | N | 51 | 209 | 0 | 9334 | null | 20240610054503 | 20190526000000 | 4 | 15 | 51 | 50 | SZ | 369 | ARZANO | NA | 3150510050 | 063005 | A455 |
| 0630050 | 3090630050 | ESERCIZIO | Europee | SCRUTINI | 20240609000000 | COMUNE | I | 50 | LAMPORECCHIO | 63 | PISTOIA | 2875 | 3075 | 5950 | 2046 | 2139 | 4185 | 70,34 | 7 | 7 | N | 169 | 219 | 0 | 3797 | null | 20240610024150 | 20190526000000 | 3 | 9 | 63 | 50 | SZ | 3391 | LAMPORECCHIO | PT | 2090630050 | 047005 | E432 |

### Liste

Questo secondo dataset - [**`liste.csv`**](data/liste.csv) - contiene i dati elettorali delle liste per ogni Comune.

Qui sono stati aggiunti i campi `CODICE ELETTORALE`, `CODICE ISTAT`, `CODICE BELFIORE`, sfruttando sempre la "[Tabella di conversione codici dei comuni italiani](https://dait.interno.gov.it/territorio-e-autonomie-locali/sut/open_data/elenco_codici_comuni_csv.php)"

| codice | pos | desc_lis | img_lis | min | max_coll | voti | perc | CODICE ELETTORALE | CODICE ISTAT | CODICE BELFIORE |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1030261080 | 15 | RASSEMBLEMENT VALDÔTAIN | 1-20240609000000-15.png | S | 1 | 2 | 0,14 | 1030261080 | 019111 | L535 |
| 5200530170 | 6 | MOVIMENTO 5 STELLE | 1-20240609000000-6.png | N | null | 11 | 13,75 | 4200530170 | 091018 | D376 |
| 1010881620 | 1 | LIBERTA' | 1-20240609000000-1.png | N | null | 1 | 0,14 | 1010881620 | 002164 | M028 |
| 4130230610 | 7 | LEGA SALVINI PREMIER | 1-20240609000000-7.png | N | null | 33 | 8,03 | 3130230610 | 069061 | G290 |
| 2050890680 | 10 | AZIONE - SIAMO EUROPEI | 1-20240609000000-10.png | N | null | 368 | 3,97 | 1050890680 | 023069 | H783 |

## Come sono stati raccolti

Leggendo il traffico web del browser è possibile visualizzare le chiamate che vengono fatte al server per recuperare i dati. Questi vengono restituiti in formato JSON.

Tra i dati leggibili, uno di partenza quello con l'**anagrafica geografica**:<br>
<https://elezioni.interno.gov.it/tornate/20240609/enti/europee_territoriale_italia.json>

Che contiene dati come questi di esempio di sotto:

```json
{
  "int": {
    "file": "GEOPOLITICA EUROPEE",
    "area": "I",
    "t_ele": "Europee",
    "dt_ele": 20240609000000
  },
  "enti": [
    {
      "cod": "1010020010",
      "desc": "ACQUI TERME",
      "tipo": "CM",
      "tipo_comune": "M",
      "dt_agg": null,
      "tipo_tras": "CO"
    },
    {
      "cod": "5190550000",
      "desc": "PALERMO",
      "tipo": "PR",
      "tipo_comune": null,
      "dt_agg": null,
      "tipo_tras": null
    },
    {
      "cod": "5190550510",
      "desc": "PALERMO",
      "tipo": "CM",
      "tipo_comune": "M",
      "dt_agg": null,
      "tipo_tras": "SZ"
    }
  ]
}
```

Si possono filtrare da questo elenco soltanto quelli di tipo `CM` (Comune), vedere quali sono gli URL per visualizzare i dati di un Comune in particolare e definire qual è la chiamata da fare per scaricare i dati relativi.<br>
Ad esempio i dati del Comune di Aqui Terme - codice `1010020010` - sono accessibili al seguente URL:<br>
<https://elezioni.interno.gov.it/europee/scrutini/20240609/scrutiniEI1010020010>

Visualizzando il traffico web del browser si può vedere che la chiamata per recuperare i dati delle delle liste in JSON è come la seguente:

```bash
curl --compressed 'https://eleapi.interno.gov.it/siel/PX/scrutiniEI/DE/20240609/TE/01/PR/002/CM/0010' \
-H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0' \
-H 'Accept: application/json, text/javascript, */*; q=0.01' \
-H 'Referer: https://elezioni.interno.gov.it/'
```

Abbiamo allora replicato queste chiamate per tutti i Comuni e per tutte le liste.
