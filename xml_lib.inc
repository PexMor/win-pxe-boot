# XML_CMD=xml
XML_CMD=xmlstarlet

function setDisk() {
    local ID=$1
    local V=$2
    if [ -z "$WTMP" ]; then
        echo "WTMP not set"
        exit -1
    fi
    # -P (or --pf)        - preserve original formatting
    # -S (or --ps)        - preserve non-significant spaces
    # -L (or --inplace)   - edit file inplace
    # -u "/domain/devices/disk[$ID]/source/@file" -v "$V" \
    $XML_CMD ed -L \
        -d "/domain/devices/disk[$ID]/source" \
        -s "/domain/devices/disk[$ID]" -t elem --name source -v "" \
        -i "/domain/devices/disk[$ID]/source" -t attr -name file -v "$V" \
        $WTMP
    echo "Setting disk #$ID to '$V'"
}

function setBoot() {
    local V=$1
    if [ -z "$WTMP" ]; then
        echo "WTMP not set"
        exit -1
    fi
    $XML_CMD ed -L \
        -d "/domain/os/boot" \
        -s "/domain/os" -t elem --name boot -v "" \
        -i "/domain/os/boot" -t attr -name dev -v "$V" \
        $WTMP
}

function updElVal() {
    local P=$1
    local V=$2
    if [ -z "$WTMP" ]; then
        echo "WTMP not set"
        exit -1
    fi
    $XML_CMD ed -L \
        -u "$P" -v "$V" \
        $WTMP
    echo "Update '$P' to '$V'"
}

function delEl() {
    local P=$1
    if [ -z "$WTMP" ]; then
        echo "WTMP not set"
        exit -1
    fi
    $XML_CMD ed -L \
        -d "$P" \
        $WTMP
    echo "Remove '$P'"
}

function setElVal() {
    local P=$1
    local N=$2
    local V=$3
    if [ -z "$WTMP" ]; then
        echo "WTMP not set"
        exit -1
    fi
    $XML_CMD ed -L \
        -s "$P" -t elem -n "$N" -v "$V" \
        $WTMP
    echo "Update '$P/$N' to '$V'"
}
