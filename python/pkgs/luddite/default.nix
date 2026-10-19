{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  packaging,
  pytestCheckHook,
  pytest-cov-stub,
  pytest-mock,
}:

buildPythonPackage (finalAttrs: {
  pname = "luddite";
  version = "1.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jumptrading";
    repo = "luddite";
    tag = "v${finalAttrs.version}";
    hash = "sha256-iJ3h1XRBzLd4cBKFPNOlIV5Z5XJ/miscfIdkpPIpbJ8=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace pytest.ini \
      --replace "--disable-socket" ""
  '';

  dependencies = [ packaging ];

  pythonImportsCheck = [ "luddite" ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-cov-stub
    pytest-mock
  ];

  meta = {
    description = "Checks for out-of-date package versions";
    mainProgram = "luddite";
    homepage = "https://github.com/jumptrading/luddite";
    license = lib.licenses.asl20;
  };
})
