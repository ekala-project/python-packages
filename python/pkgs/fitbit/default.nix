{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  freezegun,
  mock,
  pytestCheckHook,
  python-dateutil,
  requests-mock,
  requests-oauthlib,
}:

buildPythonPackage rec {
  pname = "fitbit";
  version = "0.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "orcasgit";
    repo = "python-fitbit";
    tag = version;
    hash = "sha256-1u3h47lRBrJ7EUWBl5+RLGW4KHHqXqqrXbboZdy7VPA=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace fitbit_tests/test_api.py \
      --replace-fail assertRaisesRegexp assertRaisesRegex
  '';

  dependencies = [
    python-dateutil
    requests-oauthlib
  ];

  nativeCheckInputs = [
    freezegun
    mock
    pytestCheckHook
    requests-mock
  ];

  pythonImportsCheck = [ "fitbit" ];

  meta = {
    description = "Fitbit API Python Client Implementation";
    homepage = "https://github.com/orcasgit/python-fitbit";
    license = lib.licenses.asl20;
  };
}
