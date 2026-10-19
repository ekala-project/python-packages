{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pysmartdl";
  version = "1.3.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "iTaybb";
    repo = "pySmartDL";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Etyv3xCB1cGozWDsskygwcTHJfC+V5hvqBNQAF8SIMM=";
  };

  nativeBuildInputs = [ setuptools ];

  # https://docs.python.org/3/whatsnew/3.13.html#unittest
  pythonImportsCheck = [ "pySmartDL" ];

  meta = {
    homepage = "https://github.com/iTaybb/pySmartDL";
    description = "Smart Download Manager for Python";
    license = lib.licenses.unlicense;
  };
})
