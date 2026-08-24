{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  keystoneauth1,
  openstackdocstheme,
  osc-lib,
  oslo-utils,
  pbr,
  setuptools,
  sphinxHook,
}:

buildPythonPackage rec {
  pname = "osc-placement";
  version = "4.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "openstack";
    repo = "osc-placement";
    tag = version;
    hash = "sha256-txxLtg3fDrkPqU0k/PlwvpJJBzVLtJXz82mhPWo+rKc=";
  };

  env.PBR_VERSION = version;

  build-system = [
    pbr
    setuptools
  ];

  nativeBuildInputs = [
    openstackdocstheme
    sphinxHook
  ];

  sphinxBuilders = [ "man" ];

  dependencies = [
    keystoneauth1
    osc-lib
    oslo-utils
    pbr
  ];

  pythonImportsCheck = [ "osc_placement" ];

  meta = {
    homepage = "https://github.com/openstack/osc-placement";
    description = "OpenStackClient plugin for the Placement service";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
