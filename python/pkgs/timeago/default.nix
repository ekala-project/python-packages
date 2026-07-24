{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "timeago";
  version = "1.0.16";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hustcc";
    repo = "timeago";
    tag = version;
    hash = "sha256-PqORJKAVrjezU/yP2ky3gb1XsM8obDI3GQzi+mok/OM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "timeago" ];

  meta = {
    description = "Python module to format past datetime output";
    homepage = "https://github.com/hustcc/timeago";
    license = lib.licenses.mit;
  };
}
