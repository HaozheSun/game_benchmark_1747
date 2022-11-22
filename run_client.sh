    if [ -z $1 ] || [ -z $2 ] || [ -z $3 ] || [ -z $4 ]; then
        echo "usage: ./run_client.sh <num-clients> <'gui'|'nogui'> <server-addr> <port-port>"
        exit 1
    fi

    if (( $1 <= 0 )); then
        echo "invalid number of clients, must be greater than 0!"
        exit 1
    fi
    
    for i in $(seq 1 $(( $1 - 1)) ); do
        echo "starting client #$i"
        echo "./client --$2 $3:$4" 
        ./client --nogui $3:$4  &
    done
    echo "starting client #$1"
    echo "./client --gui $3:$4" 
    ./client --gui $3:$4  &
