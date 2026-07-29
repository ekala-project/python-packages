{ lib
, stdenv
, python3
, fetchPypi
, src
, version
,
}:

let
  buildAzureCliPackage = with py.pkgs; buildPythonPackage;

  overrideAzureMgmtPackage =
    package: version: extension: hash:
    package.overridePythonAttrs (oldAttrs: {
      inherit version;

      src = fetchPypi {
        inherit (oldAttrs) pname;
        inherit version hash extension;
      };
    });

  py = python3.override {
    self = py;
    packageOverrides = self: super: {
      inherit buildAzureCliPackage;

      # core and the actual application are highly coupled
      azure-cli-core = buildAzureCliPackage {
        pname = "azure-cli-core";
        format = "setuptools";
        inherit version src;

        sourceRoot = "${src.name}/src/azure-cli-core";

        patches = [
          ./0001-optional-immutable-configuration-dir.patch
        ];

        propagatedBuildInputs =
          with self;
          [
            argcomplete
            azure-cli-telemetry
            azure-common
            azure-core
            azure-mgmt-core
            cryptography
            distro
            humanfriendly
            jmespath
            knack
            microsoft-security-utilities-secret-masker
            msal-extensions
            msal
            msrestazure
            packaging
            paramiko
            pkginfo
            psutil
            py-deviceid
            pyjwt
            pyopenssl
            requests
          ]
          ++ requests.optional-dependencies.socks;

        doCheck = false;

        pythonImportsCheck = [
          "azure.cli.telemetry"
          "azure.cli.core"
        ];

        meta.downloadPage = "https://github.com/Azure/azure-cli/tree/azure-cli-${version}/src/azure-cli-core/";
      };

      azure-cli-telemetry = buildAzureCliPackage {
        pname = "azure-cli-telemetry";
        version = "1.1.0";
        format = "setuptools";
        inherit src;

        sourceRoot = "${src.name}/src/azure-cli-telemetry";

        propagatedBuildInputs = with self; [
          applicationinsights
          portalocker
        ];

        doCheck = false;

        meta.downloadPage = "https://github.com/Azure/azure-cli/blob/azure-cli-${version}/src/azure-cli-telemetry/";
      };

      # Error loading command module 'batch': No module named 'azure.batch._model_base'
      azure-batch = super.azure-batch.overridePythonAttrs (attrs: rec {
        version = "15.0.0b1";
        src = fetchPypi {
          pname = "azure_batch";
          inherit version;
          hash = "sha256-373dFY/63lIZPj5NhsmW6nI2/9JpWkNzT65eBal04u0=";
        };
      });

      azure-mgmt-billing =
        (overrideAzureMgmtPackage super.azure-mgmt-billing "6.0.0" "zip"
          "sha256-1PXFpBiKRW/h6zK2xF9VyiBpx0vkHrdpIYQLOfL1wH8="
        ).overridePythonAttrs
          (attrs: {
            propagatedBuildInputs = attrs.propagatedBuildInputs or [ ] ++ [
              self.msrest
              self.msrestazure
            ];
          });

      # AttributeError: type object 'CustomDomainsOperations' has no attribute 'disable_custom_https'
      azure-mgmt-cdn =
        (overrideAzureMgmtPackage super.azure-mgmt-cdn "12.0.0" "zip"
          "sha256-t8PuIYkjS0r1Gs4pJJJ8X9cz8950imQtbVBABnyMnd0="
        ).overridePythonAttrs
          (attrs: {
            propagatedBuildInputs = attrs.propagatedBuildInputs or [ ] ++ [
              self.msrest
            ];
          });

      # ImportError: cannot import name 'ConfigMap' from 'azure.mgmt.containerinstance.models'
      azure-mgmt-containerinstance = super.azure-mgmt-containerinstance.overridePythonAttrs (attrs: rec {
        version = "10.2.0b1";
        src = fetchPypi {
          pname = "azure_mgmt_containerinstance";
          inherit version;
          hash = "sha256-v0u3e9ZoEnDdCnM6o6fD7N+suo5hbTqMO5jM6cSMx8A=";
        };
      });

      # ImportError: cannot import name 'ResourceSku' from 'azure.mgmt.eventgrid.models'
      azure-mgmt-eventgrid =
        overrideAzureMgmtPackage super.azure-mgmt-eventgrid "10.2.0b2" "zip"
          "sha256-QcHY1wCwQyVOEdUi06/wEa4dqJH5Ccd33gJ1Sju0qZA=";

      # ValueError: The operation 'azure.mgmt.hdinsight.operations#ExtensionsOperations.get_azure_monitor_agent_status' is invalid.
      azure-mgmt-hdinsight =
        overrideAzureMgmtPackage super.azure-mgmt-hdinsight "9.0.0b3" "tar.gz"
          "sha256-clSeCP8+7T1uI4Nec+zhzDK980C9+JGeeJFsNSwgD2Q=";

      # ValueError: The operation 'azure.mgmt.media.operations#MediaservicesOperations.create_or_update' is invalid.
      azure-mgmt-media =
        overrideAzureMgmtPackage super.azure-mgmt-media "9.0.0" "zip"
          "sha256-TI7l8sSQ2QUgPqiE3Cu/F67Wna+KHbQS3fuIjOb95ZM=";

      # ModuleNotFoundError: No module named 'azure.mgmt.monitor.operations'
      azure-mgmt-monitor = super.azure-mgmt-monitor.overridePythonAttrs (attrs: rec {
        version = "7.0.0b1";
        src = fetchPypi {
          pname = "azure_mgmt_monitor";
          inherit version;
          hash = "sha256-WR4YZMw4njklpARkujsRnd6nwTZ8M5vXFcy9AfL9oj4=";
        };
      });

      # AttributeError: module 'azure.mgmt.rdbms.postgresql_flexibleservers.operations' has no attribute 'BackupsOperations'
      azure-mgmt-rdbms =
        overrideAzureMgmtPackage super.azure-mgmt-rdbms "10.2.0b17" "tar.gz"
          "sha256-1nnRkyr4Im79B7DDqGz/FOrPAToFaGhE+a7r5bZMuOQ=";

      # azure.mgmt.resource will shadow the other azure.mgmt.resource.* packages unless we merge them together
      azure-mgmt-resource-all = py.pkgs.buildPythonPackage {
        pname = "azure-mgmt-resource-all";
        inherit version;

        pyproject = false;

        src = py.pkgs.azure-mgmt-resource.src;

        installPhase = ''
          runHook preInstall

          mkdir -p $out/${py.sitePackages}
          for pkg in ${
            lib.concatStringsSep " " (
              map (p: "${p}") [
                py.pkgs.azure-mgmt-resource
                py.pkgs.azure-mgmt-resource-deployments
                py.pkgs.azure-mgmt-resource-deploymentscripts
                py.pkgs.azure-mgmt-resource-deploymentstacks
                py.pkgs.azure-mgmt-resource-templatespecs
              ]
            )
          }; do
            cp -rs --no-preserve=mode "$pkg/${py.sitePackages}/." "$out/${py.sitePackages}/" || true
          done

          runHook postInstall
        '';

        doCheck = false;
      };

      # ImportError: cannot import name 'IPRule' from 'azure.mgmt.signalr.models'
      azure-mgmt-signalr =
        overrideAzureMgmtPackage super.azure-mgmt-signalr "2.0.0b2" "tar.gz"
          "sha256-05PUV8ouAKq/xhGxVEWIzDop0a7WDTV5mGVSC4sv9P4=";

      # ImportError: cannot import name 'AdvancedThreatProtectionName' from 'azure.mgmt.sql.models'
      azure-mgmt-sql = super.azure-mgmt-sql.overridePythonAttrs (attrs: rec {
        version = "4.0.0b22";
        src = fetchPypi {
          pname = "azure_mgmt_sql";
          inherit version;
          hash = "sha256-ku3YN9W9Cyx4zsKxAs4k9/oeDXApzi2uqAURqa72H0k=";
        };
      });

      # ValueError: The operation 'azure.mgmt.sqlvirtualmachine.operations#SqlVirtualMachinesOperations.begin_create_or_update' is invalid.
      azure-mgmt-sqlvirtualmachine =
        overrideAzureMgmtPackage super.azure-mgmt-sqlvirtualmachine "1.0.0b5" "zip"
          "sha256-ZFgJflgynRSxo+B+Vso4eX1JheWlDQjfJ9QmupXypMc=";

      # ModuleNotFoundError: No module named 'azure.mgmt.synapse.operations._kusto_pool_attached_database_configurations_operations'
      azure-mgmt-synapse =
        overrideAzureMgmtPackage super.azure-mgmt-synapse "2.1.0b5" "zip"
          "sha256-5E6Yf1GgNyNVjd+SeFDbhDxnOA6fOAG6oojxtCP4m+k=";

      # Attribute virtual_machines does not exist
      azure-mgmt-compute = super.azure-mgmt-compute.overridePythonAttrs (attrs: rec {
        version = "34.1.0";
        src = fetchPypi {
          pname = "azure_mgmt_compute";
          inherit version;
          hash = "sha256-zZ010cwbjLC9JBrVXJG3fRTgSuc8YyraEUATX5whf+E=";
        };
      });

      # ValueError: The operation 'azure.mgmt.mysqlflexibleservers.operations#LongRunningBackupOperations.begin_delete' is invalid.
      azure-mgmt-mysqlflexibleservers =
        super.azure-mgmt-mysqlflexibleservers.overridePythonAttrs
          (attrs: rec {
            version = "1.1.0b2";
            src = fetchPypi {
              pname = "azure_mgmt_mysqlflexibleservers";
              inherit version;
              hash = "sha256-yGpEFn9VOP1uSvpUCV/gYW56/5HulsCVx9wc/kWO+Ro=";
            };
          });

      # ModuleNotFoundError: No module named 'azure.mgmt.recoveryservicesbackup.activestamp'
      azure-mgmt-recoveryservicesbackup =
        super.azure-mgmt-recoveryservicesbackup.overridePythonAttrs
          (attrs: rec {
            version = "9.2.0";
            src = fetchPypi {
              pname = "azure_mgmt_recoveryservicesbackup";
              inherit version;
              hash = "sha256-xAKz4ipsOHnfVrw34AYxQsM1LFECWZ/xAtGYJPGzKyk=";
            };
          });
    };
  };
in
py
