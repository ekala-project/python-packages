{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  python,
  pillow,
}:

buildPythonPackage (finalAttrs: {
  pname = "icnsutil";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "relikd";
    repo = "icnsutil";
    tag = "v${finalAttrs.version}";
    hash = "sha256-tiq8h6s2noWLBIOIWcj8jfSqJFN01ee2uoHN4aFwn7s=";
  };

  build-system = [ setuptools ];

  dependencies = [ pillow ];

  checkPhase = ''
    ${python.interpreter} tests/test_icnsutil.py
    ${python.interpreter} tests/test_cli.py
  '';

  pythonImportsCheck = [ "icnsutil" ];

  meta = {
    description = "Create and extract .icns files";
    homepage = "https://github.com/relikd/icnsutil";
    license = lib.licenses.mit;
  };
})
