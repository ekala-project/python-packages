{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  rply,
}:

buildPythonPackage (finalAttrs: {
  pname = "baron";
  version = "0.10.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-r4Iq1E1OtCXIUW30I5rE/bqf2zmO935JJM18m0BFvC8=";
  };

  build-system = [ setuptools ];

  dependencies = [ rply ];

  pythonImportsCheck = [ "baron" ];

  meta = {
    homepage = "https://github.com/PyCQA/baron";
    description = "FST for python to make writing refactoring code a realistic task";
    license = lib.licenses.lgpl3Plus;
  };
})
