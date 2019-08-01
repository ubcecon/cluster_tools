#!/bin/bash
unset XDG_RUNTIME_DIR
jupyter lab --ip $(hostname -f) --no-browser