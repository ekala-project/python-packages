{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage rec {
  pname = "threadpoolctl";
  version = "3.6.0";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "joblib";
    repo = "threadpoolctl";
    tag = version;
    hash = "sha256-yICErKIHc9XKiWg9C9EH0il9zhbbkGntw6mlYDibr9g=";
  };

  nativeBuildInputs = [ flit-core ];

  pythonImportsCheck = [ "threadpoolctl" ];

  meta = {
    homepage = "https://github.com/joblib/threadpoolctl";
    description = "Helpers to limit number of threads used in native libraries";
    license = lib.licenses.bsd3;
  };
}
