{
  lib,
  buildPythonPackage,
  fetchPypi,
  netaddr,
  oslo-i18n,
  pbr,
  pyyaml,
  requests,
  rfc3986,
  setuptools,
  stevedore,
}:

buildPythonPackage (finalAttrs: {
  pname = "oslo-config";
  version = "10.8.0";
  pyproject = true;

  src = fetchPypi {
    pname = "oslo_config";
    inherit (finalAttrs) version;
    hash = "sha256-ziQ+x6SU5DHcemrFqgbN9a03EQ7gSHb1BeDiOH1UPuo=";
  };

  postPatch = ''
    # only a small portion of the listed packages are actually needed for running the tests
    # so instead of removing them one by one remove everything
    rm test-requirements.txt
  '';

  build-system = [ setuptools ];

  dependencies = [
    netaddr
    oslo-i18n
    pbr
    pyyaml
    requests
    rfc3986
    stevedore
  ];

  pythonImportsCheck = [ "oslo_config" ];

  meta = {
    description = "Oslo Configuration API";
    homepage = "https://github.com/openstack/oslo.config";
    license = lib.licenses.asl20;
  };
})
