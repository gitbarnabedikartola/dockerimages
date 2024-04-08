#!/usr/bin/env bash

# Inicializa a string de saída
label=""

# Itera sobre cada palavra na variável labels
for label in $labels; do
  # Acrescenta cada palavra formatada à string de saída
  label+="--labels=$label "
done

# Remove o último espaço extra
label=$(echo $label | sed 's/ $//')

if [ "$ephemeral" = "true" ];then
  ephemeralTrue='--ephemeral'
  rm -rf _work
else
  ephemeralTrue=""
fi

# run github_runner
su action -c "cd /home/action/actions-runner ; bash config.sh --url $url --token $token --runnergroup $runnergroup --name $name $label --unattended $ephemeralTrue; bash run.sh"
