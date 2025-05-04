# Joplin Server

## Introduction

A Helm chart for deploying the Joplin Server, which is used to synchronize and manage notes for the [Joplin](https://joplinapp.org/) note-taking application.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.0+

## Installation

To install the chart with the release name `my-release`, use the following command:

```bash
helm repo add nicely-dunn https://nicely-dunn.github.io/helm-charts
helm install my-release nicely-dunn/joplin-server
```

## Configuration

Please see the `values.yaml` for configurable parameters of the joplin-server chart and its default values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```bash
helm install my-release nicely-dunn/joplin-server --set replicaCount=2
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example:

```bash
helm install my-release nicely-dunn/joplin-server -f values.yaml
```

## Uninstallation

To uninstall/delete the `my-release` deployment:

```bash
helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## References

- [Joplin](https://joplinapp.org/)
