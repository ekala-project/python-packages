{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools-scm,

  # dependencies
  matplotlib,
  palettable,
  pandas,
  scipy,
}:

buildPythonPackage (finalAttrs: {
  pname = "mizani";
  version = "0.14.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "has2k1";
    repo = "mizani";
    tag = "v${finalAttrs.version}";
    hash = "sha256-aBBT0zrBFi2LW1pU83sxeRJh0B2IXa/0UNyXMfWSyAI=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    matplotlib
    palettable
    pandas
    scipy
  ];
  pythonImportsCheck = [ "mizani" ];

  meta = {
    description = "Scales for Python";
    homepage = "https://github.com/has2k1/mizani";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
