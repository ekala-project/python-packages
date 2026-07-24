{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-stdnum";
  version = "2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arthurdejong";
    repo = "python-stdnum";
    tag = version;
    hash = "sha256-X/VmD9bgOfs58m4YtmIdsYI5B4T0a68Wiiq2Ae27A8w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "stdnum" ];

  meta = {
    description = "Python module to handle standardized numbers and codes";
    homepage = "https://arthurdejong.org/python-stdnum/";
    changelog = "https://github.com/arthurdejong/python-stdnum/blob/${version}/ChangeLog";
    license = lib.licenses.lgpl21Plus;
  };
}
