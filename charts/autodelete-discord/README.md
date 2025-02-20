# Autodelete Discord

## Introduction

A Helm chart for deploying the [ksurl/docker-autodelete-discord](https://github.com/ksurl/docker-autodelete-discord) image, which is used to manage and automatically delete messages in a Discord server.

## Why?

There is no reason to use this chart over [lrstanley's chart](https://artifacthub.io/packages/helm/lrstanley/autodelete-discord) unless you are deploying to an ARM-based cluster, which is why I created this chart in the first place.

Alternatively to this chart you can use ksurl's image with lrstanley's chart and using Kustomize to patch the following:

```yaml
- op: replace
  path: /spec/template/spec/containers/0/volumeMounts/0
  value:
    name: data
    mountPath: /app/data
- op: replace
  path: /spec/template/spec/containers/0/volumeMounts/1
  value:
    name: config
    mountPath: /app/config.yml
    subPath: config.yml
```

## Prerequisites

- Kubernetes 1.12+
- Helm 3.0+

## Installation

To install the chart with the release name `my-release`, use the following command:

```bash
helm repo add nicely-dunn https://nicely-dunn.github.io/helm-charts
helm install my-release nicely-dunn/autodelete-discord
```

## Configuration

The following table lists the configurable parameters of the autodelete-discord chart and their default values.

| Parameter                     | Description                                                  | Default                  |
| ----------------------------- | ------------------------------------------------------------ | ------------------------ |
| `replicaCount`                | Number of replicas                                           | `1`                      |
| `image.repository`            | Image repository                                             | `ksurl/autodelete-discord` |
| `image.pullPolicy`            | Image pull policy                                            | `IfNotPresent`           |
| `image.tag`                   | Image tag                                                    | `--`                     |
| `serviceAccount.create`       | Specifies whether a service account should be created        | `true`                   |
| `serviceAccount.name`         | The name of the service account to use                       | `--`                     |
| `containerPort`               | The port of the container                                    | `2202`                   |
| `existingSecretName`          | Existing secret with a config.yml key                        | `--`                     |
| `config.clientid`             | Discord client ID                                            | `--`                     |
| `config.clientsecret`         | Discord client secret                                        | `--`                     |
| `config.bottoken`             | Discord bot token                                            | `--`                     |
| `config.adminuser`            | Discord admin user                                           | `--`                     |
| `config.backlog_limit`        | Backlog limit for messages                                   | `200`                    |
| `config.errorlog`             | Path to error log                                            | `--`                     |
| `config.statusmessage`        | Status message                                               | `--`                     |
| `resources.requests.cpu`      | CPU resource requests                                        | `15m`                    |
| `resources.requests.memory`   | Memory resource requests                                     | `25Mi`                   |
| `resources.limits.memory`     | Memory resource limits                                       | `50Mi`                   |
| `volumeClaimTemplate.enabled` | Enable volume claim template                                 | `true`                   |
| `volumeClaimTemplate.spec`    | Specifications for the volume claim template                 | see values.yaml          |
| `envs`                        | Additional environment variables                             | `[]`                     |
| `volumes`                     | Additional volumes                                           | `[]`                     |
| `volumeMounts`                | Additional volume mounts                                     | `[]`                     |
| `nodeSelector`                | Node selector                                                | `{}`                     |
| `tolerations`                 | Tolerations                                                  | `[]`                     |
| `affinity`                    | Affinity rules                                               | `{}`                     |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```bash
helm install my-release nicely-dunn/autodelete-discord --set replicaCount=2
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example:

```bash
helm install my-release nicely-dunn/autodelete-discord -f values.yaml
```

## Uninstallation

To uninstall/delete the `my-release` deployment:

```bash
helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Maintainers

- Nicely Dunn Cloud Corp.

## Source Code

- [autodelete-discord](https://github.com/ksurl/docker-autodelete-discord)
- [AutoDelete](https://github.com/riking/AutoDelete)
