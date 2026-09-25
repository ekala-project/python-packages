{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  georss-client,
  pytestCheckHook,
  setuptools,
}:

buildPythonPackage rec {
  pname = "georss-nrcan-earthquakes-client";
  version = "2026.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "exxamalte";
    repo = "python-georss-nrcan-earthquakes-client";
    rev = "v${version}";
    hash = "sha256-JRU+ncPRbkA/fQ6aIOX6J09ErMpgH2Rk8AF+eWR5WXg=";
  };

  build-system = [ setuptools ];

  dependencies = [ georss-client ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "georss_nrcan_earthquakes_client" ];

  meta = {
    description = "Python library for accessing Natural Resources Canada Earthquakes feed";
    homepage = "https://github.com/exxamalte/python-georss-nrcan-earthquakes-client";
    license = lib.licenses.asl20;
  };
}
