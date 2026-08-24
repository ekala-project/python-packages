{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  numpy
, scipy
, spglib
,
}:

buildPythonPackage (finalAttrs: {
  pname = "symfc";
  version = "1.7.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "symfc";
    repo = "symfc";
    tag = "v${finalAttrs.version}";
    hash = "sha256-bMG22yQszrAAh7qbQjIuaY3KjDXB95Y2OgkwKU+FW0E=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    numpy
    scipy
    spglib
  ];

  pythonImportsCheck = [ "symfc" ];

  meta = {
    description = "Generate symmetrized force constants";
    homepage = "https://github.com/symfc/symfc";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
