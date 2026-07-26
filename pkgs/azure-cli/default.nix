{ lib
, callPackage
, stdenvNoCC
, fetchFromGitHub
, installShellFiles
, python3
, makeWrapper
,
}:

let
  version = "2.88.0";

  src = fetchFromGitHub {
    name = "azure-cli-${version}-src";
    owner = "Azure";
    repo = "azure-cli";
    tag = "azure-cli-${version}";
    hash = "sha256-9lDDzUuON1fkZzvV6oAzUOZcf+t7biDzPFufZIYQrAY=";
  };

  # put packages that needs to be overridden in the py package scope
  py = callPackage ./python-packages.nix { inherit src version python3; };
in

py.pkgs.toPythonApplication (
  py.pkgs.buildAzureCliPackage rec {
    pname = "azure-cli";
    inherit version src;
    format = "setuptools";

    sourceRoot = "${src.name}/src/azure-cli";

    nativeBuildInputs = [
      installShellFiles
      py.pkgs.argcomplete
    ];

    propagatedBuildInputs =
      with py.pkgs;
      [
        antlr4-python3-runtime
        azure-ai-projects
        azure-appconfiguration
        azure-batch
        azure-cli-core
        azure-cosmos
        azure-data-tables
        azure-datalake-store
        azure-keyvault-administration
        azure-keyvault-certificates
        azure-keyvault-keys
        azure-keyvault-secrets
        azure-keyvault-securitydomain
        azure-mgmt-advisor
        azure-mgmt-apimanagement
        azure-mgmt-appconfiguration
        azure-mgmt-appcontainers
        azure-mgmt-applicationinsights
        azure-mgmt-authorization
        azure-mgmt-batchai
        azure-mgmt-batch
        azure-mgmt-billing
        azure-mgmt-botservice
        azure-mgmt-cdn
        azure-mgmt-cognitiveservices
        azure-mgmt-compute
        azure-mgmt-containerinstance
        azure-mgmt-containerregistry
        azure-mgmt-containerregistrytasks
        azure-mgmt-containerservice
        azure-mgmt-cosmosdb
        azure-mgmt-datalake-store
        azure-mgmt-datamigration
        azure-mgmt-domainregistration
        azure-mgmt-eventgrid
        azure-mgmt-eventhub
        azure-mgmt-extendedlocation
        azure-mgmt-hdinsight
        azure-mgmt-imagebuilder
        azure-mgmt-iotcentral
        azure-mgmt-iothub
        azure-mgmt-iothubprovisioningservices
        azure-mgmt-keyvault
        azure-mgmt-loganalytics
        azure-mgmt-managementgroups
        azure-mgmt-maps
        azure-mgmt-marketplaceordering
        azure-mgmt-media
        azure-mgmt-monitor
        azure-mgmt-msi
        azure-mgmt-netapp
        azure-mgmt-policyinsights
        azure-mgmt-postgresqlflexibleservers
        azure-mgmt-privatedns
        azure-mgmt-rdbms
        azure-mgmt-mysqlflexibleservers
        azure-mgmt-recoveryservicesbackup
        azure-mgmt-recoveryservices
        azure-mgmt-redhatopenshift
        azure-mgmt-redis
        azure-mgmt-resource-all
        azure-mgmt-search
        azure-mgmt-security
        azure-mgmt-servicebus
        azure-mgmt-servicefabricmanagedclusters
        azure-mgmt-servicelinker
        azure-mgmt-servicefabric
        azure-mgmt-signalr
        azure-mgmt-sqlvirtualmachine
        azure-mgmt-sql
        azure-mgmt-storage
        azure-mgmt-synapse
        azure-mgmt-trafficmanager
        azure-mgmt-web
        azure-monitor-query
        azure-storage-common
        azure-storage-blob
        azure-storage-file-datalake
        azure-storage-file-share
        azure-storage-queue
        azure-synapse-accesscontrol
        azure-synapse-artifacts
        azure-synapse-managedprivateendpoints
        azure-synapse-spark
        chardet
        colorama
      ]
      ++ lib.optional stdenvNoCC.hostPlatform.isLinux distro
      ++ [
        fabric
        javaproperties
        jsondiff
        packaging
        paramiko
        pycomposefile
        pygithub
        pynacl
        scp
        semver
        six
        sshtunnel
        tabulate
        urllib3
        websocket-client
        xmltodict

        # Other dependencies
        pyopenssl
        setuptools
      ];

    postInstall =
      lib.optionalString (stdenvNoCC.buildPlatform.canExecute stdenvNoCC.hostPlatform) ''
        installShellCompletion --cmd az \
          --bash <(register-python-argcomplete az --shell bash) \
          --zsh <(register-python-argcomplete az --shell zsh) \
          --fish <(register-python-argcomplete az --shell fish)
      ''
      + ''
        export HOME=$TMPDIR
        $out/bin/az --version
        mkdir -p $out/etc/azure
        mv $TMPDIR/.azure/commandIndex.json $out/etc/azure/commandIndex.json
        mv $TMPDIR/.azure/versionCheck.json $out/etc/azure/versionCheck.json
      ''
      + ''
        # remove garbage
        rm $out/bin/az.bat
        rm $out/bin/az.completion.sh
        rm $out/bin/azps.ps1
      '';

    postFixup = ''
      wrapProgram $out/bin/az \
        --set AZURE_IMMUTABLE_DIR $out/etc/azure \
        --set PYTHONPATH "${python3.pkgs.makePythonPath propagatedBuildInputs}:$out/${python3.sitePackages}"
    '';

    doInstallCheck = true;
    installCheckPhase = ''
      export HOME=$TMPDIR

      $out/bin/az --version
      $out/bin/az self-test
    '';

    pythonImportsCheck = [
      "azure.batch"
      "azure.cli.core"
      "azure.cli.telemetry"
      "azure.cosmos"
      "azure.datalake.store"
      "azure.keyvault"
      "azure.mgmt.advisor"
      "azure.mgmt.apimanagement"
      "azure.mgmt.applicationinsights"
      "azure.mgmt.appconfiguration"
      "azure.mgmt.appcontainers"
      "azure.mgmt.authorization"
      "azure.mgmt.batch"
      "azure.mgmt.batchai"
      "azure.mgmt.billing"
      "azure.mgmt.botservice"
      "azure.mgmt.cdn"
      "azure.mgmt.cognitiveservices"
      "azure.mgmt.compute"
      "azure.mgmt.containerinstance"
      "azure.mgmt.containerregistry"
      "azure.mgmt.containerservice"
      "azure.mgmt.cosmosdb"
      "azure.mgmt.datamigration"
      "azure.mgmt.eventgrid"
      "azure.mgmt.eventhub"
      "azure.mgmt.hdinsight"
      "azure.mgmt.imagebuilder"
      "azure.mgmt.iotcentral"
      "azure.mgmt.iothub"
      "azure.mgmt.iothubprovisioningservices"
      "azure.mgmt.keyvault"
      "azure.mgmt.loganalytics"
      "azure.mgmt.managementgroups"
      "azure.mgmt.maps"
      "azure.mgmt.marketplaceordering"
      "azure.mgmt.media"
      "azure.mgmt.monitor"
      "azure.mgmt.msi"
      "azure.mgmt.netapp"
      "azure.mgmt.policyinsights"
      "azure.mgmt.privatedns"
      "azure.mgmt.rdbms"
      "azure.mgmt.recoveryservices"
      "azure.mgmt.recoveryservicesbackup"
      "azure.mgmt.redis"
      "azure.mgmt.resource"
      "azure.mgmt.resource.deployments"
      "azure.mgmt.resource.deployments.models"
      "azure.mgmt.search"
      "azure.mgmt.security"
      "azure.mgmt.servicebus"
      "azure.mgmt.servicefabric"
      "azure.mgmt.signalr"
      "azure.mgmt.sql"
      "azure.mgmt.sqlvirtualmachine"
      "azure.mgmt.storage"
      "azure.mgmt.trafficmanager"
      "azure.mgmt.web"
      "azure.monitor.query"
      "azure.storage.common"
    ];

    meta = {
      homepage = "https://github.com/Azure/azure-cli";
      description = "Next generation multi-platform command line experience for Azure";
      downloadPage = "https://github.com/Azure/azure-cli/releases/tag/azure-cli-${version}";
      changelog = "https://github.com/MicrosoftDocs/azure-docs-cli/blob/main/docs-ref-conceptual/release-notes-azure-cli.md";
      sourceProvenance = [ lib.sourceTypes.fromSource ];
      license = lib.licenses.mit;
      mainProgram = "az";
      platforms = lib.platforms.all;
    };
  }
)
