#!/bin/bash

print_usage() {
    printf "Usage:\tposting [OPTIONS] [COMMANDS]\n"
    printf "\nRun Posting TUI\n\n"
    printf "Options:\n"
    printf "  -d, --data-dir\tstring\tThe path to the data directory. Used to preserve data\n"
    printf "\n"
    printf "Commands:\n"
    printf "  help \t\tDisplay usage and how to use the script\n"
}

DATA_DIR="$HOME/.posting/data"

while true; do
    case "$1" in
        -d | --data-dir ) DATA_DIR="$2"; shift 2 ;;
        help) print_usage; exit 0 ;;
        -- ) shift; break ;;
        * ) break ;;
    esac
done

mkdir -p $DATA_DIR/.local/share/posting
mkdir -p $DATA_DIR/.config/posting

IMAGE_TAG="noahjahn-posting"
CONTAINER_NAME="$IMAGE_TAG-$(date +%s)"

SCRIPT_DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

docker build -f "$SCRIPT_DIR/Dockerfile" -t $IMAGE_TAG . || exit 1;

docker run --rm -it -v $DATA_DIR/.local/share/posting:/home/posting/.local/share/posting -v $DATA_DIR/.config/posting:/home/posting/.config/posting --name $CONTAINER_NAME $IMAGE_TAG $@ || exit 1;
