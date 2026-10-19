{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  grandalf,
  matplotlib,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "crysp";
  version = "1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bdcht";
    repo = "crysp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-51SKS6OOXIFT1L3YICR6a4QGSz/rbB8V+Z0u0jMO474=";
  };

  build-system = [ setuptools ];

  dependencies = [
    grandalf
    matplotlib
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "'pytest-runner'," ""
  '';

  pythonImportsCheck = [ "crysp" ];

  meta = {
    description = "Module that provides crypto-related facilities";
    homepage = "https://github.com/bdcht/crysp";
    license = lib.licenses.gpl2Only;
  };
})
