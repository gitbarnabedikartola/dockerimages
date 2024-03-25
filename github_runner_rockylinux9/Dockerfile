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
  && chown action:action -R /home/action/actions-runner

CMD [ "su" "-" "action" "-c" "bash /home/action/actions-runner/config.sh --url $url --token $token --runnergroup $runnergroup --name $name --labels $labels --unattended ; bash /home/action/actions-runner/run.sh"  ]

