{
  lib,
  buildPythonPackage,
  cliff,
  fetchFromGitHub,
  keystoneauth1,
  openstacksdk,
  oslo-i18n,
  oslo-utils,
  pbr,
  requests,
  setuptools,
  stevedore,
}:

buildPythonPackage rec {
  pname = "osc-lib";
  version = "4.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "openstack";
    repo = "osc-lib";
    tag = version;
    hash = "sha256-XwOJSd3k/74FvSZGveSTjH+KGLlQ2jNbk8GrTzFhbL0=";
  };

  patches = [
    ./fix-pyproject.diff
  ];

  env.PBR_VERSION = version;

  build-system = [
    pbr
    setuptools
  ];

  dependencies = [
    cliff
    keystoneauth1
    openstacksdk
    oslo-i18n
    oslo-utils
    requests
    stevedore
  ];

  pythonImportsCheck = [
    "osc_lib"
  ];

  meta = {
    description = "OpenStackClient Library";
    homepage = "https://github.com/openstack/osc-lib";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
