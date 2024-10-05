#!/bin/bash

# Run the Python script using Poetry
# --old is time in hours to go back in history
poetry run python hive-watcher.py --notify_podwords --old 8
