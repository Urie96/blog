parent=$(basename $PWD)
title=$1
template="---
title: "$title"
date: $(date +"%Y-%m-%dT%H:%M:%S+08:00")
# hero: /images/.svg
menu:
  sidebar:
    name: "$title"
    parent: $parent
    # weight: 10
---
"

echo "$template" >"$title".md
