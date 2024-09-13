#!/bin/bash

commands=("ab -m GET -n 1000 -c 100 http://benchmarking.benchmarking.svc.cluster.local:8080/api/calculator/factorial/1000" "ab -m GET -n 2000 -c 200 http://benchmarking.benchmarking.svc.cluster.local:8080/api/calculator/factorial/2000")

output_folder="m6a_large"

output_file_prefix="m6a_large"

output_file_extension=".txt"

num_iterations=3

mkdir -p "$output_folder"

for ((i = 1; i <= num_iterations; i++)); do
  output_file="${output_file_prefix}_${i}${output_file_extension}"
  output_path="$output_folder/$output_file"
  
  echo "Execução $i:" >> "$output_path"
  
  for cmd in "${commands[@]}"; do
    echo "Comando: $cmd" >> "$output_path"
    $cmd >> "$output_path"
    echo "---------------------------------" >> "$output_path"
  done
  
  echo "Resultados da execução $i gravados em '$output_path'."
done

echo "Execuções concluídas. Arquivos gravados na pasta '$output_folder'."
