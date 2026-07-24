{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "callee";
  version = "0.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Xion";
    repo = "callee";
    tag = finalAttrs.version;
    hash = "sha256-dsXMY3bW/70CmTfCuy5KjxPa+NLCzxzWv5e1aV2NEWE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "callee" ];

  doCheck = false; # missing dependency
  meta = {
    description = "Argument matchers for unittest.mock";
    homepage = "https://github.com/Xion/callee";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
