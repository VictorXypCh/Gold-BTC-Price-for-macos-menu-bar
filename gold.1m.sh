#!/bin/bash

# Fetch gold price (XAU/USD) 
GOLD_PRICE=$(curl -s https://api.gold-api.com/price/XAU | jq '.price // "0"' | xargs printf "%.0f")

# Fetch BTC price (BTC/USD) 
BTC_PRICE_API="https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"
BTC=$(curl -s "$BTC_PRICE_API" | jq '.bitcoin.usd // "0"' | xargs printf "%.0f")

echo "G: \$$GOLD_PRICE , ₿: \$$BTC"

