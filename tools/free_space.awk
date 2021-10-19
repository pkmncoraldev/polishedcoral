#!/usr/bin/awk -f

# Usage: tools/free_space.awk coral-in-progress.map

BEGIN {
    total = free = 16384 * 128
    mbc5 = 0
}
/^  SECTION: \$[0-7]/ {
    if (mbc5 == 0) { free -= strtonum("0x" substr($3, 3)) }
}
/^ROMX bank #(12[89]|1[3-9][0-9]|[2-9][0-9][3-9])/ {
    mbc5 = 1
    print "skip beyond " $0
}
END {
    printf "Free space: %d/%d (%.2f%%)\n", free, total, free * 100 / total
}