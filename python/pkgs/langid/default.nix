{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  numpy,
}:

buildPythonPackage (finalAttrs: {
  pname = "langid";
  version = "1.1.6";
  pyproject = true;

  src = fetchPypi {
    # use PyPi as source, github repository does not contain tags or release branches
    inherit (finalAttrs) pname version;
    hash = "sha256-BEvK4ZEtq4XDPY6Y8oEbj0/xIT5emp6VEBN7hNosspM=";
  };

  build-system = [ setuptools ];

  dependencies = [ numpy ];

  pythonImportsCheck = [ "langid" ];

  meta = {
    description = "Langid.py is a standalone Language Identification (LangID) tool";
    mainProgram = "langid";
    homepage = "https://pypi.org/project/langid/";
    license = lib.licenses.bsd2;
  };
})
