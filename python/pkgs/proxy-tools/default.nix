{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "proxy_tools";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zLN1H1KcBH4tilhEDYayBTA88P6BRveE0cvNlPCigBA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "proxy_tools" ];

  meta = {
    homepage = "https://github.com/jtushman/proxy_tools";
    description = "Simple Proxy implementation for Python";
    license = lib.licenses.bsd2;
  };
}
