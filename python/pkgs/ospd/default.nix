{
  lib,
  stdenv,
  buildPythonPackage,
  defusedxml,
  deprecated,
  fetchFromGitHub,
  # build-system
  setuptools,
  lxml,
  paramiko,
  psutil,
}:

buildPythonPackage rec {
  pname = "ospd";
  version = "21.4.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "greenbone";
    repo = "ospd";
    tag = "v${version}";
    hash = "sha256-dZgs+G2vJQIKnN9xHcNeNViG7mOIdKb+Ms2AKE+FC4M=";
  };

  build-system = [ setuptools ];

  dependencies = [
    defusedxml
    deprecated
    lxml
    paramiko
    psutil
  ];

  pythonImportsCheck = [ "ospd" ];

  meta = {
    description = "Framework for vulnerability scanners which support OSP";
    homepage = "https://github.com/greenbone/ospd";
    license = lib.licenses.agpl3Plus;
    broken = stdenv.hostPlatform.isDarwin;
  };
}
