{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  georss-client,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "georss-tfs-incidents-client";
  version = "0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "exxamalte";
    repo = "python-georss-tfs-incidents-client";
    tag = "v${version}";
    hash = "sha256-Cz0PRcGReAE0mg04ktCUaoLqPTjvyU1TiB/Pdz7o7zo=";
  };

  build-system = [ setuptools ];

  dependencies = [ georss-client ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "georss_tfs_incidents_client" ];

  meta = {
    description = "Python library for accessing Tasmania Fire Service Incidents feed";
    homepage = "https://github.com/exxamalte/python-georss-tfs-incidents-client";
    license = lib.licenses.asl20;
  };
}
