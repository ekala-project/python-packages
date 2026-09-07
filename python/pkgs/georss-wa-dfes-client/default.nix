{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  georss-client,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "georss-wa-dfes-client";
  version = "2026.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "exxamalte";
    repo = "python-georss-wa-dfes-client";
    rev = "v${version}";
    hash = "sha256-9wkGwuO8FV3ZJWq0LqdUFFwW4WQw+f826mTPFp+LMpw=";
  };

  build-system = [ setuptools ];

  dependencies = [ georss-client ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "georss_wa_dfes_client" ];

  meta = {
    description = "Python library for accessing WA Department of Fire and Emergency Services (DFES) feed";
    homepage = "https://github.com/exxamalte/python-georss-wa-dfes-client";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
