# helm-charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/nicely-dunn-helm-charts)](https://artifacthub.io/packages/search?repo=nicely-dunn-helm-charts) ![Release Charts](https://github.com/nicely-dunn/helm-charts/actions/workflows/release.yml/badge.svg?branch=main)

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add nicely-dunn https://nicely-dunn.github.io/helm-charts

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
nicely-dunn` to see the charts.

To install a chart:

    helm install my-chart-name nicely-dunn/<chart-name>

To uninstall the chart:

    helm uninstall my-chart-name
