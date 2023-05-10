@{
    # This is the PowerShell datafile used to provide configuration information for the Agora environment. Product keys and password are not encrypted and will be available on host during installation.

    # Directory paths
    AgDirectories       = @{
        AgDir             = "C:\Ag"
        AgPowerShellDir   = "C:\Ag\PowerShell"
        AgLogsDir         = "C:\Ag\Logs"
        AgVMDir           = "C:\Ag\Virtual Machines"
        AgKVDir           = "C:\Ag\KeyVault"
        AgGitOpsDir       = "C:\Ag\GitOps"
        AgIconDir         = "C:\Ag\Icons"
        AgAgentScriptsDir = "C:\Ag\agentScripts"
        AgToolsDir        = "C:\Tools"
        AgTempDir         = "C:\Temp"
        AgVHDXDir         = "C:\Ag\VHDX"
        AgL1Files         = "C:\Ag\L1Files"
        AgAppsRepo        = "C:\Ag\AppsRepo"
    }

    # Required URLs
    URL           = @{
        chocoPackagesUrl = 'https://community.chocolatey.org/api/v2'
        chocoInstallScriptUrl = 'https://chocolatey.org/install.ps1'
        wslUbuntuUrl = 'https://aka.ms/wslubuntu'
        wslStoreStorageUrl = 'https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi'
        dockerUrl = 'https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe'
        githubAPIUrl = 'https://api.github.com'
        grafanaUrl = 'https://api.github.com/repos/grafana/grafana/releases/latest'
        azurePortalUrl = 'https://portal.azure.com'
        aksEEk3sUrl = 'https://aka.ms/aks-edge/k3s-msi'
    }

    # Azure required registered resource providers
    AzureProviders      = @(
        "Microsoft.Kubernetes",
        "Microsoft.KubernetesConfiguration",
        "Microsoft.ExtendedLocation"
    )

    # Az CLI required extensions
    AzCLIExtensions     = @(
        'k8s-extension',
        'k8s-configuration',
        'azure-iot'
    )

    # PowerShell modules
    PowerShellModules   = @(
        'Az.ConnectedKubernetes'
    )

    # Chocolatey app list
    ChocolateyAppList   = @(
        'azure-cli',
        'az.powershell',
        'kubernetes-cli',
        'vcredist140',
        'microsoft-edge',
        'azcopy10',
        'vscode',
        'git',
        '7zip',
        'kubectx',
        'putty.install',
        'kubernetes-helm',
        'dotnetcore-3.1-sdk',
        'zoomit',
        'openssl.light',
        'mqtt-explorer',
        'gh'
    )

    # VSCode extensions
    VSCodeExtensions    = @(
        'ms-vscode-remote.remote-containers',
        'ms-vscode-remote.remote-wsl',
        'ms-vscode.powershell',
        'redhat.vscode-yaml',
        'ZainChen.json',
        'esbenp.prettier-vscode',
        'ms-kubernetes-tools.vscode-kubernetes-tools',
        'mindaro.mindaro'
    )

    # Git branches
    GitBranches         = @(
        'production',
        'staging',
        'canary' ,
        'main'
    )

    # VHDX blob url
    ProdVHDBlobURL = 'https://jsvhds.blob.core.windows.net/agora/contoso-supermarket-w11/AGBase.vhdx?sp=r&st=2023-05-06T14:38:41Z&se=2033-05-06T22:38:41Z&spr=https&sv=2022-11-02&sr=b&sig=DTDZOvPlzwrjg3gppwVo1TdDZRgPt5AYBfe9YeKEobo%3D'
    PreProdVHDBlobURL = 'https://jsvhds.blob.core.windows.net/agora/contoso-supermarket-w11-preprod/*?si=Agora-RL&spr=https&sv=2021-12-02&sr=c&sig=Afl5LPMp5EsQWrFU1bh7ktTsxhtk0QcurW0NVU%2FD76k%3D'

    # L1 virtual machine configuration
    HostVMPath                           = "V:\VMs"                              # This value controls the path where the nested virtual machines will be stored the host.
    L1VMMemory                           = 24GB                                  # This value controls the amount of RAM for each AKS Edge Essentials host virtual machine
    L1VMNumVCPU                          = 4                                     # This value controls the number of vCPUs to assign to each AKS Edge Essentials host virtual machine.
    InternalSwitch                       = "InternalSwitch"                      # This value controls the Hyper-V internal switch name used by L0 Azure virtual machine.
    L1Username                           = "Administrator"                       # This value controls the Admin credential username for the L1 Hyper-V virtual machines that run on the Agora-Client.
    L1Password                           = 'Agora123!!'                          # This value controls the Admin credential password for the L1 Hyper-V virtual machines that run on the Agora-Client.
    L1DefaultGateway                     = "172.20.1.1"                          # This value controls the default gateway IP address used by each L1 Hyper-V virtual machines that run on the Agora-Client.
    L1SwitchName                         = "AKS-Int"                             # This value controls the Hyper-V internal switch name used by each L1 Hyper-V virtual machines that run on the Agora-Client.
    L1NatSubnetPrefix                    = "172.20.1.0/24"                       # This value controls the network subnet used by each L1 Hyper-V virtual machines that run on the Agora-Client.

    # NAT Configuration
    natHostSubnet       = "192.168.128.0/24"
    natHostVMSwitchName = "InternalNAT"
    natConfigure        = $true
    natSubnet           = "192.168.46.0/24"                      # This value is the subnet is the NAT router will use to route to  AzSMGMT to access the Internet. It can be any /24 subnet and is only used for routing.
    natDNS              = "%staging-natDNS%"                     # Do not change - can be configured by passing the optioanl natDNS parameter to the ARM deployment.

    # AKS Edge Essentials variables
    SiteConfig          = @{
        Seattle = @{
            ArcClusterName         = "Ag-ArcK8s-Seattle"
            NetIPAddress           = "172.20.1.2"
            DefaultGateway         = "172.20.1.1"
            PrefixLength           = "24"
            DNSClientServerAddress = "168.63.129.16"
            ServiceIPRangeStart    = "172.20.1.31"
            ServiceIPRangeSize     = "10"
            ControlPlaneEndpointIp = "172.20.1.21"
            LinuxNodeIp4Address    = "172.20.1.11"
            Subnet                 = "172.20.1.0/24"
            FriendlyName           = "Seattle"
            IsProduction           = $true
            Type                   = "AKSEE"
            posNamespace           = "contoso-supermarket"
            Branch                 = "production"
            HelmSetValue           = "alertmanager.enabled=false,grafana.enabled=false,prometheus.service.type=LoadBalancer"
            HelmService            = "service/prometheus-kube-prometheus-prometheus"
            GrafanaDataSource      = "seattle"
        }
        Chicago = @{
            ArcClusterName         = "Ag-ArcK8s-Chicago"
            NetIPAddress           = "172.20.1.3"
            DefaultGateway         = "172.20.1.1"
            PrefixLength           = "24"
            DNSClientServerAddress = "168.63.129.16"
            ServiceIPRangeStart    = "172.20.1.71"
            ServiceIPRangeSize     = "10"
            ControlPlaneEndpointIp = "172.20.1.61"
            LinuxNodeIp4Address    = "172.20.1.51"
            Subnet                 = "172.20.1.0/24"
            FriendlyName           = "Chicago"
            IsProduction           = $true
            Type                   = "AKSEE"
            posNamespace           = "contoso-supermarket"
            Branch                 = "canary"
            HelmSetValue           = "alertmanager.enabled=false,grafana.enabled=false,prometheus.service.type=LoadBalancer"
            HelmService            = "service/prometheus-kube-prometheus-prometheus"
            GrafanaDataSource      = "chicago"
        }
        Dev     = @{
            ArcClusterName         = "Ag-ArcK8s-Dev"
            NetIPAddress           = "172.20.1.4"
            DefaultGateway         = "172.20.1.1"
            PrefixLength           = "24"
            DNSClientServerAddress = "168.63.129.16"
            ServiceIPRangeStart    = "172.20.1.101"
            ServiceIPRangeSize     = "10"
            ControlPlaneEndpointIp = "172.20.1.91"
            LinuxNodeIp4Address    = "172.20.1.81"
            Subnet                 = "172.20.1.0/24"
            FriendlyName           = "Dev"
            IsProduction           = $false
            Type                   = "AKSEE"
            posNamespace           = "contoso-supermarket"
            Branch                 = "main"
            HelmSetValue           = "alertmanager.enabled=false,grafana.ingress.enabled=true,grafana.service.type=LoadBalancer,grafana.adminPassword=Agora123!!"
            HelmService            = "service/prometheus-grafana"
            GrafanaDataSource      = "prometheus"
        }
        Staging = @{
            ArcClusterName      = "Ag-AKS-Staging"
            FriendlyName        = "Staging"
            IsProduction        = $false
            Type                = "AKS"
            posNamespace        = "contoso-supermarket"
            Branch              = "staging"
            HelmSetValue        = "alertmanager.enabled=false,grafana.ingress.enabled=true,grafana.service.type=LoadBalancer,grafana.adminPassword=Agora123!!"
            HelmService         = "service/prometheus-grafana"
            GrafanaDataSource   = "prometheus"
        }
    }

    # Universal resource tag and resource types
    TagName = 'Project'
    TagValue = 'Jumpstart_Agora'
    ArcServerResourceType = 'Microsoft.HybridCompute/machines'
    ArcK8sResourceType = 'Microsoft.Kubernetes/connectedClusters'

    # Observability variables
    Monitoring = @{
        UserName = "admin"
        Password = 'Agora123!!'
        Namespace = "observability"
        ProdURL = "http://localhost:3000"
        Dashboards = @('1860','6417')
    }

    # Microsoft Edge startup settings variables
    EdgeSettingRegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Edge'
    EdgeSettingValueTrue = '00000001'
    EdgeSettingValueFalse = '00000000'

    Namespaces = @(
        "contoso-supermarket"
        "observability"
    )

    AppConfig = @{
        ContosoSupermarket = @{
            #GithubRepo = "https://github.com/microsoft/azure-arc-jumpstart-apps"
            #Branch = "main"
            GitOpsConfigName = "config-supermarket"
            Kustomization = "name=pos path=./contoso_supermarket/operations/contoso_supermarket/release"
            Namespace = "contoso-supermarket"
        }
        # SensorMonitor = @{
        #     GithubRepo = "https://github.com/microsoft/azure-arc-jumpstart-apps"
        #     Branch = "main"
        #     GitOpsConfigName = "config-sensormonitor"
        #     Kustomization = "name=bookstore path=./bookstore/yaml"
        # }
    }
}