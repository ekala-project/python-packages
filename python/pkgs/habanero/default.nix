{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  httpx2,
  tqdm,
  urllib3,
  vcrpy,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "habanero";
  version = "2.9.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sckott";
    repo = "habanero";
    tag = "v${version}";
    hash = "sha256-XRqMq0L0fedFt4hX6p4XzNeRxg8JL/xdIfuqLdpVnzo=";
  };

  build-system = [ hatchling ];

  pythonRelaxDeps = [ "urllib3" ];

  dependencies = [
    httpx2
    tqdm
    urllib3
  ];

  nativeCheckInputs = [
    pytestCheckHook
    vcrpy
  ];

  pythonImportsCheck = [ "habanero" ];

  # almost the entirety of the test suite makes network calls
  enabledTestPaths = [ "test/test-filters.py" ];

  meta = {
    description = "Python interface to Library Genesis";
    homepage = "https://habanero.readthedocs.io/";
    license = lib.licenses.mit;
  };
}
