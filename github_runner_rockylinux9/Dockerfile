FROM rockylinux:9

RUN useradd action \
&& mkdir -p /home/action/actions-runner \
&& <<"EOF" cat >> /home/action/actions-runner/start-actions-runner.sh
#!/usr/bin/env bash

# Inicializa a string de saída
label="--labels "

# Itera sobre cada palavra na variável labels
for l in $labels; do
  # Acrescenta cada palavra formatada à string de saída
  label+="$l,"
done

# Remove o último espaço extra
if [ "$ephemeral" = "true" ];then
  ephemeralTrue="--ephemeral"
else
  ephemeralTrue=""
fi

# run github_runner
su action -c "cd /home/action/actions-runner ; bash config.sh --url $url --token $token --runnergroup $runnergroup --name $name $label --unattended $ephemeralTrue; bash run.sh"
EOF

RUN dnf install epel-release -y \
  && dnf install -y \
    sudo \
    tmate \
  && dnf clean all \
  && cd /home/action/actions-runner \
  && version=$(gh release -R actions/runner list | grep Latest | awk '{print $1}' | sed 's/v//') \
  && curl -o actions-runner-linux-x64-${version}.tar.gz -L https://github.com/actions/runner/releases/download/v${version}/actions-runner-linux-x64-${version}.tar.gz \
  && tar xzf ./actions-runner-linux-x64-${version}.tar.gz \
  && rm -f actions-runner-linux-x64-${version}.tar.gz \
  && echo "$version" > version.txt \
  && bash ./bin/installdependencies.sh \
  && chmod +x /home/action/actions-runner/start-actions-runner.sh \
  && chown action:action -R /home/action/actions-runner

WORKDIR /home/action/actions-runner

ENTRYPOINT ["/home/action/actions-runner/start-actions-runner.sh"]
