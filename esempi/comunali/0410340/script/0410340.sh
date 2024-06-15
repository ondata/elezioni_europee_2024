#!/bin/bash

set -x
set -e
set -u
set -o pipefail

folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "${folder}"/../data
mkdir -p "${folder}"/tmp

# Per ogni sezione da 0001 a 0102, scarica il file json se non esiste
for i in $(seq -w 0001 0102); do
  if [ ! -f "${folder}"/tmp/"$i".json ]; then
    curl --compressed 'https://eleapi.interno.gov.it/siel/PX/scrutiniG/DE/20240609/TE/08/PR/041/CM/0340/SZ/'"$i"'' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://elezioni.interno.gov.it/' > "${folder}"/tmp/"$i".json
  fi
done

# if "${folder}"/../data/0410340.jsonl exists, remove it
if [ -f "${folder}"/../data/0410340.jsonl ]; then
  rm "${folder}"/../data/0410340.jsonl
fi

# per ogni JSON scaricato, estrai i dati lista appiattiti e scrivili in un file JSONL
for i in "${folder}"/tmp/*.json; do
  jq -c '
  . as $root |
  .cand[] as $cand |
  $cand.liste[] |
  {
    sez: $root.int.cod_sez,
    cod_prov: $root.int.cod_prov,
    cod_com: $root.int.cod_com,
    cogn: $cand.cogn,
    d_nasc: $cand.d_nasc,
    l_nasc: $cand.l_nasc,
    pos: $cand.pos,
    tot_vot_lis: $cand.tot_vot_lis,
    descr_lista: .descr_lista,
    voti: .voti
  }
' "${i}" >>"${folder}"/../data/0410340.jsonl
done

# converti il file JSONL in CSV
mlrgo -S --ijsonl --ocsv cat "${folder}"/../data/0410340.jsonl >>"${folder}"/../data/0410340.csv
