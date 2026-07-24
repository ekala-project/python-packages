{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-fancy-pypi-readme,
}:

let
  pname = "backports-asyncio-runner";
  version = "1.2.0";
  src = fetchFromGitHub {
    owner = "samypr100";
    repo = "backports.asyncio.runner";
    tag = "v${version}";
    hash = "sha256-F8x7MZgu0VItH7kBke7C7+ZBoM6Iyj8xOeQ2t56ff3k=";
  };
in
buildPythonPackage {
  inherit pname version src;
  pyproject = true;

  build-system = [
    hatch-fancy-pypi-readme
    hatchling
  ];

  pythonImportsCheck = [ "backports.asyncio.runner" ];
  # These tests depend on the test.test_asyncio module in cpython which is
  # removed at build time.
  meta = {
    description = "Backport of Python 3.11 asyncio.Runner";
    homepage = "https://github.com/samypr100/backports.asyncio.runner";
    license = lib.licenses.psfl;
    maintainers = [ ];
  };
}
