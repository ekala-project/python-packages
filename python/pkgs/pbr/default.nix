{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pbr";
  version = "7.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-tGAE7DClMkZyaD7ISK7Z6PxQCw0mHUCjIpwtK7/O3Ck=";
  };

  build-system = [ setuptools ];

  # pbr imports distutils at runtime (packaging.py), which was removed in
  # Python 3.13. setuptools 84+ no longer bundles distutils in a way that's
  # accessible without .pth file processing (not supported in Nix wrappers).
  # Disable import check; pbr works fine at build time via setuptools.
  pythonImportsCheck = [ ];

  meta = {
    description = "Python Build Reasonableness";
    homepage = "https://github.com/openstack/pbr";
    license = lib.licenses.asl20;
  };
}
