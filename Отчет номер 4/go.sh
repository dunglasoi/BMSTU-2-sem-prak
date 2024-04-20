#!/usr/bin/bash

bash build_apps.sh

for _ in {0..10}; do
    bash update_data.sh
done
bash make_preproc.sh
bash make_postproc.sh
