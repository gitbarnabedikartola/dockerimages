FROM rockylinux:9

RUN useradd action \
&& mkdir -p /home/action/actions-runner \
&& <<"EOF" cat >> /home/action/actions-runner/start-actions-runner.sh
#!/usr/bin/env bash

# get a new token using userToken or use token defined for the runner
if [ -n "$userToken" ];then
  token=$(curl -s -L -X POST -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $userToken" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/orgs/$repo/actions/runners/registration-token | grep -Eo "[A-Z0-9]{29}")
else
  token=$runnerToken
fi

# Inicializa a string de saída
label="--labels "
# Itera sobre cada palavra na variável labels
for l in $labels; do
  # Acrescenta cada palavra formatada à string de saída
  label+="$l,"
done

# verifica se o runner é ephemeral
if [ "$ephemeral" = "true" ];then
  ephemeralTrue="--ephemeral"
  rm -rf _work
else
  ephemeralTrue=""
fi

# run github_runner
su action -c "cd /home/action/actions-runner ; bash config.sh --url https://github.com/$repo --token $token --runnergroup $runnergroup --name $name $label --unattended $ephemeralTrue; bash run.sh"
EOF

RUN dnf install epel-release -y \
  && curl -fsSL https://cli.github.com/packages/rpm/gh-cli.repo | tee /etc/yum.repos.d/github-cli.repo \
  && dnf install -y \
    gh \
    jq \
    git \
    sudo \
    tmate \
  && dnf clean all \
  && cd /home/action/actions-runner \
  && curl -s https://api.github.com/repos/actions/runner/releases/latest | jq -r '.assets[] | select(.name | contains("actions-runner-linux-x64-")) |  .browser_download_url' | xargs curl -L -o actions-runner-linux.tar.gz \
  && tar xzf ./actions-runner-linux.tar.gz \
  && rm -f actions-runner-linux.tar.gz \
  && echo $(curl -s https://api.github.com/repos/actions/runner/releases/latest | jq -r '.tag_name') > version.txt \
  && bash ./bin/installdependencies.sh \
  && chmod +x /home/action/actions-runner/start-actions-runner.sh \
  && chown action:action -R /home/action/actions-runner

WORKDIR /home/action/actions-runner

ENTRYPOINT ["/home/action/actions-runner/start-actions-runner.sh"]
