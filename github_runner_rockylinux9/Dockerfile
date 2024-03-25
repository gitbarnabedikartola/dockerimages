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
  && bash ./bin/installdependencies.sh \
  && echo 'su action -c "cd /home/action/actions-runner ; bash config.sh --url $url --token $token --runnergroup $runnergroup --name $name --labels $labels --unattended ; bash run.sh"' | tee /home/action/actions-runner/start-actions-runner.sh \
  && chmod +x /home/action/actions-runner/start-actions-runner.sh \
  && chown action:action -R /home/action/actions-runner

WORKDIR /home/action/actions-runner

ENTRYPOINT ["/home/action/actions-runner/start-actions-runner.sh"]
