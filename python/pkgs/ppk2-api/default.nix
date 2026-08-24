{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pyserial,
}:

buildPythonPackage rec {
  pname = "ppk2-api";
  version = "0.9.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "IRNAS";
    repo = "ppk2-api-python";
    tag = "v${version}";
    hash = "sha256-fubDFtOXiv2YFYUCOUbuyXs1sHgs0/6ZVK9sAwxQ+Pk=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyserial ];

  # Module has no tests
  pythonImportsCheck = [ "ppk2_api" ];

  meta = {
    description = "Power Profiling Kit 2 unofficial Python API";
    homepage = "https://github.com/IRNAS/ppk2-api-python";
    license = lib.licenses.gpl2Only;
    maintainers = [ ];
  };
}
