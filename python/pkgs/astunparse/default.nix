{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
  wheel,
}:

buildPythonPackage (finalAttrs: {
  pname = "astunparse";
  version = "1.6.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Wtk6hFbw0ITDRW0Fn9mpLM5meWMjLL92Pqw7xbeUCHI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    six
    wheel
  ];

  # tests not included with pypi release

  pythonImportsCheck = [ "astunparse" ];

  meta = {
    description = "Factored out version of unparse found in the Python source distribution";
    homepage = "https://github.com/simonpercivall/astunparse";
    license = lib.licenses.bsd3;
  };
})
