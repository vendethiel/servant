set -eu
node regurgitate.mjs items.js I > items.json
node regurgitate.mjs crafts.js CR > crafts.json
node regurgitate.mjs monsters.js MSR MR M > monsters.json
node regurgitate.mjs itemsets.js IS > itemsets.json
node regurgitate.mjs houses.js H > houses.json
node regurgitate.mjs spells.js S > spells.json
node regurgitate.mjs maps.js MA > maps.json
sed -i '' 's/new Array/new Object/'  itemstats.js
node regurgitate.mjs itemstats.js ISTA  > itemstats.json
