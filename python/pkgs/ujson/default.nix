{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "ujson";
  version = "6.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-rvfqTNni6fijXEU4qXgNWMgNdsXaZqja0mm0zG2TDCk=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  pythonImportsCheck = [ "ujson" ];

  meta = {
    description = "Ultra fast JSON encoder and decoder";
    homepage = "https://github.com/ultrajson/ultrajson";
    license = lib.licenses.bsd3;
  };
})
