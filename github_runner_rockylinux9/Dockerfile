FROM rockylinux:9

ENV version=2.314.1

RUN dnf install epel-release -y \
  && dnf install -y \
    sudo \
    tmate \
  && dnf clean all \
  && useradd action \
  && mkdir -p /home/action/actions-runner \
  && cd /home/action/actions-runner \
  && curl -o actions-runner-linux-x64-${version}.tar.gz -L https://github.com/actions/runner/releases/download/v${version}/actions-runner-linux-x64-${version}.tar.gz \
  && tar xzf ./actions-runner-linux-x64-${version}.tar.gz \
  && rm -f actions-runner-linux-x64-${version}.tar.gz \
  && echo "$version" > version.txt \
  && bash ./bin/installdependencies.sh

# COPY start-actions-runner.sh /home/action/actions-runner/

RUN bash -c 'cat << 'EOF' > /home/action/actions-runner/start-actions-runner.sh
#!/usr/bin/env bash
# Inicializa a string de saída
label=""
# Itera sobre cada palavra na variável labels
for label in \$labels; do
  # Acrescenta cada palavra formatada à string de saída
  label+="--labels=\$label "
done
# Remove o último espaço extra
label=\$(echo \$label | sed "s/ \$//")
if [ "\$ephemeral" = "true" ];then
  ephemeralTrue="--ephemeral"
else
  ephemeralTrue=""
fi
# run github_runner
su action -c "cd /home/action/actions-runner ; bash config.sh --url \$url --token \$token --runnergroup \$runnergroup --name \$name \$label --unattended \$ephemeralTrue; bash run.sh"
EOF'

RUN chmod +x /home/action/actions-runner/start-actions-runner.sh \
  && chown action:action -R /home/action/actions-runner

#   && echo -e '#!/usr/bin/env bash\nsu action -c "cd /home/action/actions-runner ; bash config.sh --url $url --token $token --runnergroup $runnergroup --name $name --labels $labels --unattended --ephemeral; bash run.sh"' | tee /home/action/actions-runner/start-actions-runner.sh \
#   && chmod +x /home/action/actions-runner/start-actions-runner.sh \
#; bash config.sh remove --token $token

WORKDIR /home/action/actions-runner

ENTRYPOINT ["/home/action/actions-runner/start-actions-runner.sh"]
