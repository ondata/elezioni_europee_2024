#!/bin/bash

set -x
set -e
set -u
set -o pipefail

folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "${folder}"/../data/affluenza

# da provincia 001 a 106 scarica i dati di affluenza
for i in $(seq -w 1 106); do
# se "${folder}"/../data/affluenza/"$i".json esiste non fare il curl
    if [ ! -f "${folder}"/../data/affluenza/"$i".json ]; then
        curl --compressed 'https://eleapi.interno.gov.it/siel/PX/votanti/DE/20240609/TE/01/PR/'"$i"'' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://elezioni.interno.gov.it/' >"${folder}"/../data/affluenza/"$i".json
    fi
done

curl --compressed 'https://eleapi.interno.gov.it/siel/PX/votanti/DE/20240609/TE/01/PR/111' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://elezioni.interno.gov.it/' >"${folder}"/../data/affluenza/111.json


# se "${folder}"/../data/affluenza.jsonl esiste, cancellalo
if [ -f "${folder}"/../data/affluenza.jsonl ]; then
    rm "${folder}"/../data/affluenza.jsonl
fi

# per tutti i file json di affluenza, estrai alcuni dati e salvali in un file jsonl
for i in $(ls "${folder}"/../data/affluenza/*.json); do
    nomefile=$(basename "${i}" .json)
    jq -c '
      .enti.enti_f[] as $ente_f |
      .enti.ente_p as $ente_p |
      $ente_p.com[] as $com_p |
      $ente_f.com_vot[] |
      select(.com == 4) |
      {
        "ente_p": $ente_p.desc,
        "cod_reg": $com_p.cod_reg,
        "cod_prov": "'"$nomefile"'",
        "desc": $ente_f.desc,
        "cod": $ente_f.cod,
        "ele_m": $ente_f.ele_m,
        "ele_f": $ente_f.ele_f,
        "ele_t": $ente_f.ele_t,
        "una_lis": $ente_f.una_lis,
        "tipo_tras": $ente_f.tipo_tras,
        "com": .com,
        "dt_com": .dt_com,
        "enti_p": .enti_p,
        "enti_t": .enti_t,
        "perc": .perc,
        "vot_m": .vot_m,
        "vot_f": .vot_f,
        "vot_t": .vot_t,
        "perc_r": .perc_r
      }
    ' "${i}" >> "${folder}"/../data/affluenza.jsonl
done

# aggiungi la colonna join, per fare il join con il file codici_comuni_10-06-2024.csv, con i codici ISTAT dei comuni
mlrgo -I -S --jsonl put '$join=$cod_prov.fmtnum(int($cod),"%04d")' "${folder}"/../data/affluenza.jsonl

# converti il jsonl in csv
mlrgo --ijsonl --ocsv unsparsify "${folder}"/../data/affluenza.jsonl > "${folder}"/../data/affluenza.csv

# estrai i campi necessari dal file codici_comuni_10-06-2024.csv
mlrgo --csv cut -f join,"CODICE ISTAT" "${folder}"/../risorse/codici_comuni_10-06-2024.csv > "${folder}"/tmp.csv

# fai il join tra il file affluenza.csv e il file codici_comuni_10-06-2024.csv
mlrgo --csv join --ul -j join -f "${folder}"/../data/affluenza.csv then unsparsify "${folder}"/tmp.csv > "${folder}"/../data/tmp.csv

# rinomina il file tmp.csv in affluenza.csv
mv "${folder}"/../data/tmp.csv "${folder}"/../data/affluenza.csv

# se il file "${folder}"/tmp.csv esiste, cancellalo
if [ -f "${folder}"/tmp.csv ]; then
    rm "${folder}"/tmp.csv
fi
