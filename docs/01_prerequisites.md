---
layout: default
title: Kubernetes tutorial
description: Azure Kubernetes Service, Terraform, Helm, Prometheus, Grafana, Skaffold
breadcrumb1: 1. Prerequisites
---
[<< Back to index](../){:class="solid-btn text-center"}

# Kubernetes tutorial

## 1. Prerequisites

In this section we will install the required software, create an Azure account, and use the Azure CLI to log in and enabled several resource providers.

### Install software prerequisites

You will need to install the following tools:

* [Azure Command Line Interface (CLI)](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest): To create Azure resources, use Terraform with your Azure account, and retrieve credentials Kubernetes configuration.
* [Terraform](https://www.terraform.io/downloads.html): To automatically provision infrastructure (resource group, managed Kubernetes cluster).
* Docker ([linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/), [mac](https://docs.docker.com/docker-for-mac/install/), [win](https://docs.docker.com/docker-for-windows/install/)): Used by Skaffold to build and push images.
* [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/): Used by Skaffold to control the cluster, we will also use it to inspect it from the command line.
* [Skaffold](https://skaffold.dev/docs/getting-started/#installing-skaffold): To deploy the microservices to the cluster.
* [Helm](https://helm.sh/docs/using_helm/#installing-helm): To install the prometheus-operator Helm chart.
  * Windows: `choco install kubernetes-helm`
  * MacOs: `brew install kubernetes-helm`
  * Linux: `sudo snap install helm --classic`

### Clone the Hipster Shop repository

Open a terminal in the root folder of this project, and execute this command to clone the Hipster Shop repository from GitHub:

```bash
git clone https://github.com/GoogleCloudPlatform/microservices-demo.git
```

### Create an Azure account

Visit the Azure portal website and create a new account:

 * http://azure.microsoft.com/

### Configure Azure CLI

Use `az login` to log into your Azure account. A new browser window will open where you can finish the login procedure before returning to the terminal.
If using a remote terminal or an environment without a browser, an special code and URL will be shown to open in another computer's browser to finish the login procedure.

```console
$ az login

Note, we have launched a browser for you to login. For old experience with device code, use "az login --use-device-code"
You have logged in. Now let us find all the subscriptions to which you have access...
[
  {
    "cloudName": "AzureCloud",
    "id": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
    "isDefault": true,
    "name": "Your-subscription-name",
    "state": "Enabled",
    "tenantId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
    "user": {
      "name": "your.email@your.domain.example.com",
      "type": "user"
    }
  }
]
```

Now your `az` command line instructions will use your account credentials.
We will later need the "id" value shown when you log in.

_Optional_: You can check any time what account you are logged in and this information with:

```console
$ az account show
```

You may need to register the use of the following providers with your Azure account to create the kind of resources we are going to use. They are needed to create new resources related to those providers.

```bash
az provider register -n Microsoft.Network
az provider register -n Microsoft.Storage
az provider register -n Microsoft.Compute
az provider register -n Microsoft.ContainerService
```

---
[Next step: 2. Initial Azure resources setup >>](../docs/02_setup_az_sp.md){:class="solid-btn text-center"}  

[<< Previous step: 0. Getting started](../docs/00_getting_started.md){:class="solid-btn text-center"}
