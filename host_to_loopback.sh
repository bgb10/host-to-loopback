USAGE="Usage: $0 [-a/-d] <URL>"

if [ $# -eq 0 ] 
then 
    echo $USAGE
    exit 1
fi

while getopts a:d: opt
do
    case $opt in
        a) 
            url=$OPTARG
            new_line="127.0.0.1\t$url"

            if grep -q "$new_line" /etc/hosts; then
                echo "Line for $url already exists in /etc/hosts. No changes made."
            else
                echo "$new_line" | sudo tee -a /etc/hosts > /dev/null
                echo "Line added for $url in /etc/hosts."
            fi
            ;;
        d) 
            url=$OPTARG
            new_line="127.0.0.1\t$url"

            if grep -q "$new_line" /etc/hosts; then
                sudo grep -v "$new_line" /etc/hosts > /etc/hosts.tmp
                sudo mv /etc/hosts.tmp /etc/hosts
                echo "Line for $url deleted from /etc/hosts."
            else
                echo "No changes made for $url as it does not exist in /etc/hosts."
            fi
            ;;  
        *) 
            echo $USAGE
            exit 1
            ;;
    esac
done