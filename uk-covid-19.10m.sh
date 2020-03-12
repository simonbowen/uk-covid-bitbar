#!/bin/bash
PATH=$HOME/go/bin:/usr/local/bin:$PATH

COVID_DATA="$(curl -s https://services1.arcgis.com/0IrmI40n5ZYxTUrV/arcgis/rest/services/DailyIndicators/FeatureServer/0/query\?f\=json\&where\=1%3D1\&returnGeometry\=false\&spatialRel\=esriSpatialRelIntersects\&outFields\=\*\&outSR\=102100\&resultOffset\=0\&resultRecordCount\=50\&cacheHint\=true | jq '.features[0].attributes')"

TOTAL_CASES="$(echo $COVID_DATA | jq .TotalUKCases)"
NEW_CASES="$(echo $COVID_DATA | jq .NewUKCases)"
TOTAL_DEATHS="$(echo $COVID_DATA | jq .TotalUKDeaths)"
ENGLAND_CASES="$(echo $COVID_DATA | jq .EnglandCases)"
SCOTLAND_CASES="$(echo $COVID_DATA | jq .ScotlandCases)"
WALES_CASES="$(echo $COVID_DATA | jq .WalesCases)"
NI_CASES="$(echo $COVID_DATA | jq .NICases)"

echo "COVID-19 🇬🇧 $TOTAL_DEATHS 💀 $TOTAL_CASES 😷"
echo ---
echo "🏴󠁧󠁢󠁥󠁮󠁧󠁿 $ENGLAND_CASES"
echo "🏴󠁧󠁢󠁳󠁣󠁴󠁿 $SCOTLAND_CASES"
echo "🏴󠁧󠁢󠁷󠁬󠁳󠁿 $WALES_CASES"
echo "NI $NI_CASES"