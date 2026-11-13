{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "sphinxcontrib-jsmath";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinxcontrib_jsmath";
    inherit (finalAttrs) version;
    sha256 = "sha256-VR94DPlof5w8dPDPnxisoG4NaViFNFPzgD/k01fFuSQ=";
  };

  build-system = [ flit-core ];

  # Check is disabled due to circular dependency of sphinx

  pythonNamespaces = [ "sphinxcontrib" ];

  meta = {
    description = "Sphinx extension which renders display math in HTML via JavaScript";
    homepage = "https://github.com/sphinx-doc/sphinxcontrib-jsmath";
    license = lib.licenses.bsd0;
  };
})
